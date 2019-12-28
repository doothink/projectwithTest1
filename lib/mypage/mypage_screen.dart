import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/mypage/mypage.dart';

class MyPageScreen extends StatelessWidget {
  MyPageScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios, color: const Color(0xff585858)),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: BlocProvider<MyPageBloc>(
        builder: (context) => MyPageBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: Container(
          child: Text("my page"),
        ),
      ),
    );
  }
}
