import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged({@required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];

  @override
  String toString() =>
      'ConfirmPasswordChanged { confirmPassword: $confirmPassword }';
}

class Submitted extends RegisterEvent {
  final String lastName;
  final String firstName;
  final String nickName;
  final String email;
  final String password;
  final String confirmPassword;

  const Submitted({
    @required this.lastName,
    @required this.firstName,
    @required this.nickName,
    @required this.email,
    @required this.password,
    @required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        lastName,
        firstName,
        nickName,
        email,
        password,
        confirmPassword,
      ];

  @override
  String toString() {
    return 'Submitted { email: $email }';
  }
}
