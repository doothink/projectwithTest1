import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'feed.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            '피드',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr-Medium",
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
          ),
        ),
        actions: <Widget>[],
      ),
      body: BlocProvider<FeedBloc>(
          builder: (context) => FeedBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: FeedMain()),
    );
  }
}
