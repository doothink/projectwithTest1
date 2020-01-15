import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/playerhistory/playerhistory.dart';

import 'bloc/bloc.dart';

class PlayerHistoryScreen extends StatefulWidget {
  PlayerHistoryScreen({Key key}) : super(key: key);

  @override
  State<PlayerHistoryScreen> createState() => _PlayerHistoryScreenState();
}

//final GlobalKey<_PlayerHistoryPostState> _stateKey = GlobalKey();

class _PlayerHistoryScreenState extends State<PlayerHistoryScreen> {
  PlayerHistoryBloc _playerHistoryBloc;

  @override
  void initState() {
    super.initState();

    _playerHistoryBloc = PlayerHistoryBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, _playerHistoryBloc.state.playerHistories);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(
                context, _playerHistoryBloc.state.playerHistories),
          ),
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
//        bottomOpacity: 0.1,
//        elevation: 0.0,
          title: const Text(
            '출전 경기 히스토리',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr-Medium",
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Text(
                  "저장",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 166, 219, 1),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Medium",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                ),
                iconSize: 26,
                onPressed: () {
                  _playerHistoryBloc.add(PlayerHistorySaveButtonPressed());
                },
              ),
            ),
            // overflow menu
          ],
        ),
        body: BlocProvider<PlayerHistoryBloc>(
            builder: (context) => _playerHistoryBloc,
            child: SingleChildScrollView(
              child: PlayerHistoryPost(),
            )),
      ),
    );
  }
}
