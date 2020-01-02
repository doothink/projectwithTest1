import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/register/register.dart';
import 'package:with_flutter/validators.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationBloc _authenticationBloc;

  RegisterBloc({@required AuthenticationBloc authenticationBloc})
      : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transformEvents(
    Stream<RegisterEvent> events,
    Stream<RegisterState> Function(RegisterEvent event) next,
  ) {
    final observableStream = events as Observable<RegisterEvent>;
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
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(
        event.lastName,
        event.firstName,
        event.nickName,
        event.email,
        event.password,
        event.confirmPassword,
      );
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String lastName,
    String firstName,
    String nickName,
    String email,
    String password,
    String confirmPassword,
  ) async* {
    yield RegisterState.loading();
    try {
      await _signUp(
        lastName,
        firstName,
        nickName,
        email,
        password,
        confirmPassword,
      );
      yield RegisterState.success();
    } catch (error) {
      print("]-----] _mapFormSubmittedToState::error [-----[ $error");
      yield RegisterState.failure(error.message);
    }
  }

  Future<void> _signUp(
    String lastName,
    String firstName,
    String nickName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    String body = json.encode({
      "lastName": lastName,
      "firstName": firstName,
      "nickName": nickName,
      "username": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "email": email,
    });
    return await _authenticationBloc.postWithoutAuth('/auth/signup', body);
  }
}
