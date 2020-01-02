import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/common/error_message.dart';
import 'package:with_flutter/user_repository.dart';
import 'package:with_flutter/common/common.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  final http.Client _httpClient;

//  final String apiUrl = API_URL_LOCAL;

  final String apiUrl = API_URL_DEV;
//  final String apiUrl = API_URL_PROD;

  AuthenticationBloc({
    @required UserRepository userRepository,
    @required http.Client httpClient,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        assert(httpClient != null),
        _httpClient = httpClient;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    await Future.delayed(Duration(seconds: 3));
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = await _userRepository.getUser();
        yield Authenticated(name);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

  Map<String, dynamic> parseJwt(String token) {
    String tokenBody = token.replaceAll("Bearer ", '');
    final parts = tokenBody.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  getAccessToken() {
    return _userRepository.getAccessToken();
  }

  Future<dynamic> get(String url) async {
    String accessToken = await _userRepository.getAccessToken();
    if (accessToken != null) {
      final response = await _httpClient.get(apiUrl + url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        "Authorization": accessToken
      });

//      print(utf8.decode(response.bodyBytes));
//      print(response.body);
      if (response.statusCode == 200) {
//        print(response.body);
        if (response.body != null) {
          return json.decode(utf8.decode(response.bodyBytes));
        } else {
          return null;
        }
      } else if (response.statusCode == 401) {
        this.add(LoggedOut());
      } else if (response.statusCode == 404) {
        return null;
      } else {
        throw Exception('Error fetching get');
      }
    } else {
      this.add(LoggedOut());
    }
  }

  Future<dynamic> post(String url, String body) async {
    String accessToken = await _userRepository.getAccessToken();
    if (accessToken != null) {
      final response = await _httpClient.post(apiUrl + url,
          headers: {
            'Content-Type': 'application/json',
            "Authorization": accessToken
          },
          body: body);
      print(response.body);
      if (response.statusCode == 200) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 401) {
        this.add(LoggedOut());
      } else {
//        throw Exception('Error post api');
        var result = json.decode(response.body);
        throw Exception(ErrorMessage.getValue(result['code']));
      }
    } else {
      this.add(LoggedOut());
    }
  }

  Future<dynamic> put(String url, String body) async {
    String accessToken = await _userRepository.getAccessToken();
    if (accessToken != null) {
      final response = await _httpClient.put(apiUrl + url,
          headers: {
            'Content-Type': 'application/json',
            "Authorization": accessToken
          },
          body: body);
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        this.add(LoggedOut());
      } else {
        throw Exception('Error post api');
      }
    } else {
      this.add(LoggedOut());
    }
  }

  Future<dynamic> delete(String url) async {
    String accessToken = await _userRepository.getAccessToken();
    if (accessToken != null) {
      final response = await _httpClient.delete(
        apiUrl + url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": accessToken
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        this.add(LoggedOut());
      } else {
        throw Exception('Error post api');
      }
    } else {
      this.add(LoggedOut());
    }
  }

  Future<dynamic> basicAuth(String url, String basicToken) async {
//    print(']-------] basicAuth basicToken [-------[ ${basicToken}');
//    print(']-------] basicAuth apiUrl [-------[ ${apiUrl}');
    final response = await _httpClient.get(apiUrl + url, headers: {
      "Authorization": basicToken,
      "Access-Control-Expose-Headers": "Authorization"
    });
    print(']-------] basicAuth call [-------[ ${response.body}');
//    print(']-------] basicAuth call [-------[ ${response.headers}');

//    var result = json.decode(response.body);
//    print(']-------] basicAuth result [-------[ ${result['code']}');
    if (response.statusCode == 200) {
      final data = response.headers;
      await _userRepository.persistToken(data['authorization']);
      return data['authorization'];
    } else {
      var result = json.decode(response.body);
      throw Exception(ErrorMessage.getValue(result['code']));
    }
  }

  Future<dynamic> postWithoutAuth(String url, String body) async {
    print(']-------] postWithoutAuth body [-------[ ${body}');
    final response = await _httpClient.post(apiUrl + url,
        headers: {'Content-Type': 'application/json'}, body: body);
//    print("===body== ${response.body}");
//    print("===statusCode== ${response.statusCode}");
//    print("===headers== ${response.headers}");
    if (response.statusCode == 200) {
      return true;
    } else {
      var result = json.decode(response.body);
      throw Exception(ErrorMessage.getValue(result['code']));
    }
  }

  Future<dynamic> snsAuth(String url, String body) async {
    print(']-------] snsAuth body [-------[ ${body}');
    final response = await _httpClient.post(apiUrl + url,
        headers: {'Content-Type': 'application/json'}, body: body);
    print("===body== ${response.body}");
//    print("===statusCode== ${response.statusCode}");
//    print("===headers== ${response.headers}");
    try {
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
//        print("===accessToken== ${data["accessToken"]}");
        await _userRepository.persistToken(data["accessToken"]);
        return data["accessToken"].toString();
      } else {
        throw Exception('Error snsAuth');
      }
    } catch (error) {
      print("snsAuth error ==] ${error}");
      throw Exception('Error catch snsAuth');
    }
  }
}
