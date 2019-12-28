import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginWithCredentialsPressed({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}

class LoginWithKakaoPressed extends LoginEvent {
  final String email;
  final String snsId;
  final String snsType;
  final String snsToken;
  final String phoneNumber;
  final String nickName;

  const LoginWithKakaoPressed({
    this.email,
    @required this.snsId,
    @required this.snsType,
    this.snsToken,
    this.phoneNumber,
    this.nickName,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'LoginWithKakaoPressed { email: $email }';
  }
}

class Registered extends LoginEvent {
  @override
  String toString() {
    return 'Registered';
  }
}
