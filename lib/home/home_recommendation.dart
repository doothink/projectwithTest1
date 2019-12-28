import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/home/home.dart';

class HomeRecommendation extends StatefulWidget {
  HomeRecommendation({
    Key key,
  }) : super(key: key);

  State<HomeRecommendation> createState() => _HomeRecommendationState();
}

class _HomeRecommendationState extends State<HomeRecommendation> {
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
          return Container(
            width: MediaQuery.of(context).size.width,
//            height: 190.0,
            padding: EdgeInsets.only(
                top: 10.0, bottom: 23.0, left: 15.0, right: 15.0),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recommendation",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
//                      decoration:
//                          BoxDecoration(color: Color.fromRGBO(48, 190, 157, 1)),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: 81.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/dump/aaaaaasdfasdf@3x.png'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(48, 190, 157, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Club",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    "울산현대FC",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "울산, 대한민국",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: 81.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/dump/sadfa@3x.png'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(16, 168, 211, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Player",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    "이근호",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "울산, 대한민국",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: 81.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/dump/asdfasfd1@3x.png'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(68, 135, 229, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Agent",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    "김정일",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "서울, 대한민국",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: 81.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/dump/naver@3x.png'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(100, 92, 215, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Fan",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    "이지헌",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "서울, 대한민국",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
