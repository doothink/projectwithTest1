import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/club/club.dart';

import 'club_main.dart';

class ClubScreen extends StatefulWidget {
  final int _clubId;

  ClubScreen({Key key, @required int clubId})
      : assert(clubId != null),
        _clubId = clubId,
        super(key: key);

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  int get _clubId => widget._clubId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ClubBloc>(
          builder: (context) => ClubBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: SingleChildScrollView(
            child: ClubMain(
              clubId: _clubId,
            ),
          )),
    );
  }
}
