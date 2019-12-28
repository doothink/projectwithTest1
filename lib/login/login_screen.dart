import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/login/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: LoginIntro(),
      ),
    );
  }
}
