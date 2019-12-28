import 'package:flutter/material.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/playerHistory.dart';

class ProfilePlayerHistory extends StatelessWidget {
  final PlayerHistory _playerHistory;

  ProfilePlayerHistory({
    Key key,
    @required PlayerHistory playerHistory,
  })  : assert(playerHistory != null),
        _playerHistory = playerHistory,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
//                                margin: EdgeInsets.only(right: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      _playerHistory.playYear.isNotEmpty
                          ? _playerHistory.playYear
                          : "",
                      style: TextStyle(
                        color: Color.fromRGBO(124, 124, 124, 1),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
//                                        height: 1,
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      thickness: 0.8,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _playerHistory.leagueName.isNotEmpty
                              ? _playerHistory.leagueName
                              : "",
                          style: TextStyle(
                            color: Color.fromRGBO(124, 124, 124, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Medium",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      thickness: 0.8,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/284@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.selectionPlayCount != null
                                  ? _playerHistory.selectionPlayCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/916@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.playCount != null
                                  ? _playerHistory.playCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/283@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.goalCount != null
                                  ? _playerHistory.goalCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/809@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.assistCount != null
                                  ? _playerHistory.assistCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/446@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.yellowCardCount != null
                                  ? _playerHistory.yellowCardCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/icons/447@3x.png',
                                width: 13,
                              ),
                            ),
                            Text(
                              _playerHistory.redCardCount != null
                                  ? _playerHistory.redCardCount.toString()
                                  : "0",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(112, 112, 112, 1),
                  thickness: 0.8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
