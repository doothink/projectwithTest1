import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'jobinfo_heart_main.dart';

class JobInfoHeartScreen extends StatefulWidget {
  JobInfoHeartScreen({Key key, @required int jobInfoId}) : super(key: key);

  @override
  State<JobInfoHeartScreen> createState() => _JobInfoHeartScreenState();
}

class _JobInfoHeartScreenState extends State<JobInfoHeartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/icons/779@3x.png'),
                width: 20,
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Text(
                  '좋아요 한 공고 보기',
                  style: TextStyle(
                    color: Color.fromRGBO(88, 88, 88, 1),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Medium",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider<JobInfoHeartBloc>(
        builder: (context) => JobInfoHeartBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: JobInfoHeartMain(),
      ),
    );
  }
}
