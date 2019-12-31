import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'profile_view_main.dart';

class ProfileViewScreen extends StatefulWidget {
  final int _memberId;

  ProfileViewScreen({Key key, @required int memberId})
      : assert(memberId != null),
        _memberId = memberId,
        super(key: key);

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  ProfileViewBloc _profileViewBloc;

  int get _memberId => widget._memberId;

  @override
  void initState() {
    super.initState();

    _profileViewBloc = ProfileViewBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
//        bottomOpacity: 0.0,
//        elevation: 0.0,
        title: const Text('사용자정보'),
      ),
      body: BlocProvider<ProfileViewBloc>(
          builder: (context) => _profileViewBloc,
          child: SingleChildScrollView(
            child: ProfileViewMain(
              memberId: _memberId,
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
