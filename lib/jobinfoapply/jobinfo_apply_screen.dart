import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'jobinfo_apply_main.dart';

class JobInfoApplyScreen extends StatefulWidget {
  JobInfoApplyScreen({Key key, @required int jobInfoId}) : super(key: key);

  @override
  State<JobInfoApplyScreen> createState() => _JobInfoApplyScreenState();
}

class _JobInfoApplyScreenState extends State<JobInfoApplyScreen> {
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
                image: AssetImage('assets/images/icons/781@3x.png'),
                width: 20,
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Text(
                  '내 지원 현황 보기',
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
        ),
      ),
      body: BlocProvider<JobInfoApplyBloc>(
        builder: (context) => JobInfoApplyBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: JobInfoApplyMain(),
      ),
    );
  }
}
