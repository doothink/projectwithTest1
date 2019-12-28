import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/user_repository.dart';
import 'package:with_flutter/simple_bloc_delegate.dart';
import 'package:with_flutter/splash_screen.dart';
import 'package:with_flutter/login/login.dart';
import 'package:with_flutter/home/home.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(
        userRepository: userRepository,
        httpClient: http.Client(),
      )..add(AppStarted()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(48, 190, 157, 1),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen();
          }
          if (state is Authenticated) {
            return HomeScreen();
          }
          return SplashScreen();
        },
      ),
    );
  }
}
