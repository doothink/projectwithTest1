import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';

import 'bloc/home_bloc.dart';
import 'home_apply_now.dart';

class HomeApplyScreen extends StatelessWidget {
  HomeApplyScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      builder: (context) => HomeBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
      child: HomeApplyNow(),
    );
  }
}
