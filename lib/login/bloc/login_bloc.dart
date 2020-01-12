import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/login/login.dart';
import 'package:with_flutter/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final observableStream = events as Observable<LoginEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = observableStream.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is LoginWithKakaoPressed) {
      yield* _mapLoginWithKakaoPressedToState(
        email: event.email,
        snsId: event.snsId,
        snsType: event.snsType,
        snsToken: event.snsToken,
        phoneNumber: event.phoneNumber,
        nickName: event.nickName,
      );
    } else if (event is Registered) {
      yield* _mapRegisteredToState();
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
//      isPasswordValid: Validators.isValidPassword(password),
        );
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final basicToken =
          'Basic ' + base64.encode(utf8.encode('$email:$password'));
//      print(basicToken);
      final token = await _signinGet(basicToken);

      yield LoginState.success();
    } catch (error) {
      yield LoginState.failure(error.message);
    }
  }

  Future<String> _signinGet(String basicToken) async {
//    print(basicToken);
    final accessToken =
        await _authenticationBloc.basicAuth("/auth/signin", basicToken);

    return accessToken;
  }

  Stream<LoginState> _mapLoginWithKakaoPressedToState({
    String email,
    String snsId,
    String snsType,
    String snsToken,
    String phoneNumber,
    String nickName,
  }) async* {
    yield LoginState.loading();
    try {
      await _signinSnsGet(
        email,
        snsId,
        snsType,
        snsToken,
        phoneNumber,
        nickName,
      );

      yield LoginState.success();
    } catch (error) {
      print(error);
      yield LoginState.failure(error.message);
    }
  }

  Future<dynamic> _signinSnsGet(
    String email,
    String snsId,
    String snsType,
    String snsToken,
    String phoneNumber,
    String nickName,
  ) async {
    String body = json.encode({
      "email": email,
      "snsId": snsId,
      "snsType": snsType,
      "snsToken": snsToken,
      "phoneNumber": phoneNumber,
      "nickName": nickName,
      "username": snsId,
    });
    return _authenticationBloc.snsAuth("/auth/signinsns", body);
  }

  Stream<LoginState> _mapRegisteredToState() async* {
    yield state.updateIsRegisterd(isRegisterd: true);
  }
}
