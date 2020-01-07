import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'notice.dart';

class NoticeScreen extends StatelessWidget {
  NoticeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,

        title: Row(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/icons/785@3x.png'),
              width: 20,
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                "공지사항",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr-Medium",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
//        actions: <Widget>[],
      ),
      body: BlocProvider<NoticeBloc>(
          builder: (context) => NoticeBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: NoticeMain()),
    );
  }
}
