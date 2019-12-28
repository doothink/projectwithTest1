import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class WalletMain extends StatefulWidget {
  WalletMain({
    Key key,
  }) : super(key: key);

  @override
  State<WalletMain> createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
  WalletBloc _walletBloc;

  @override
  void initState() {
    super.initState();

    _walletBloc = BlocProvider.of<WalletBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state.isLoaded) {
          debugPrint("]-----] state.isLoaded [-----[");
        }
      },
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 51),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/wikenSkb@3x.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "0",
                        style: TextStyle(
                          color: Color.fromRGBO(88, 88, 88, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        " WIKEN",
                        style: TextStyle(
                          color: Color.fromRGBO(88, 88, 88, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
