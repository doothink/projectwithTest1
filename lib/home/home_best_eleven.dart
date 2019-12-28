import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/home/home.dart';

class HomeBestEleven extends StatefulWidget {
  HomeBestEleven({
    Key key,
  }) : super(key: key);

  State<HomeBestEleven> createState() => _HomeBestElevenState();
}

class _HomeBestElevenState extends State<HomeBestEleven> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
//              height: 345.0,
              decoration: BoxDecoration(color: Color.fromRGBO(62, 62, 62, 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Best Eleven",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Bold",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 3.0,
                    ),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 280.0,
                        child: Center(
                          child: Container(
                            height: 240.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/main/soccerField@3x.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/379Ba1043C2B8A96Ee4E0A8C75F0A2E1@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Ulsan FC",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/lockerroom@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Lockerroom",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width * 0.14,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/om2S821F93Sfwhwg7Xmd@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Son H",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width * 0.416,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/naverbookingPhinfPstatic@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Jiheon L",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 52.0,
                        right: MediaQuery.of(context).size.width * 0.14,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/naverbookingPhinfPstatic@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "JEB Ent.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 102.0,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/1200PxJapanNationalFootballTeamCrestSvg@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "JEB Ent.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 102.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/manchesterCityFcMatches600X375@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "JEB Ent.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 162.0,
                        left: MediaQuery.of(context).size.width * 0.14,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/i@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "JEB Ent.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150.0,
                        left: MediaQuery.of(context).size.width * 0.416,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/ie002204851Std@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Hwang H",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 162.0,
                        right: MediaQuery.of(context).size.width * 0.14,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/img@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Stella J",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220.0,
                        left: MediaQuery.of(context).size.width * 0.416,
                        child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/dump/oJik3Rl@3x.png'),
                                  width: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Seoul FC",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),


                ],
              ),
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
