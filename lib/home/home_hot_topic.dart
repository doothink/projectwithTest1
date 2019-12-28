import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/with_card.dart';

class HomeHotTopic extends StatefulWidget {
  HomeHotTopic({
    Key key,
  }) : super(key: key);

  State<HomeHotTopic> createState() => _HomeHotTopicState();
}

class _HomeHotTopicState extends State<HomeHotTopic> {
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
            padding: EdgeInsets.only(
                top: 15.0, bottom: 10.0, left: 15.0, right: 15.0),
            decoration: BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hot Topic",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Stack(children: <Widget>[
                          Container(
                            height: 155.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage('assets/images/dump/001@3x.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5.0,
                            right: 6.0,
                            child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/icons/filledHeart341288@3x.png'),
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                        "55",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 8.0, right: 10.0),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "팬이 즐길 수 있는 경기를 만들기 위해선 즐거운 응원이 필수적이죠!!",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr-Bold",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      "울산 현대 김광현 응원단장 인터뷰",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(121, 121, 121, 1),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr-Regular",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0,
                                      ),
                                      maxLines: 2,
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
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HomeHotTopicCard(
                        withCard: WithCard(
                          title: '화성 FC를 분석 해 보았다',
                          name: 'HwaSungJuMin123',
                          imageUrl: '0201@3x.png',
                          logoUrl: 'logo2@3x.png',
                        ),
                      ),
                      HomeHotTopicCard(
                        withCard: WithCard(
                          title: '울산 경기가 재미 없는 이유',
                          name: 'UlSanBigFan',
                          imageUrl: '0051@3x.png',
                          logoUrl: 'download1@3x.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HomeHotTopicCard(
                        withCard: WithCard(
                          title: '오늘자 이근호 미친 돌파력.AVI',
                          name: '2GHo',
                          imageUrl: '0061@3x.png',
                          logoUrl: 'invalidName@3x.png',
                        ),
                      ),
                      HomeHotTopicCard(
                        withCard: WithCard(
                          title: '오늘 스리랑카전 예측',
                          name: 'KoreaLover',
                          imageUrl: '06501@3x.png',
                          logoUrl: '1494566844613672320@3x.png',
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
