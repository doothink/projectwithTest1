import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'wallet.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({
    Key key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
//        bottomOpacity: 0.0,
//        elevation: 0.0,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "내지갑",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr-Medium",
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
          ),
        ),
//        actions: <Widget>[],
      ),
      body: BlocProvider<WalletBloc>(
        builder: (context) => WalletBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: WalletMain(),
      ),
    );
  }
}
