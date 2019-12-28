import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/jobInfo.dart';

class HomeApplyNow extends StatefulWidget {
  HomeApplyNow({
    Key key,
  }) : super(key: key);

  State<HomeApplyNow> createState() => _HomeApplyNowState();
}

class _HomeApplyNowState extends State<HomeApplyNow> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(JobInfosLoad(size: 6));
//    _homeBloc.add(JobInfosEmpty());
  }

  JobInfo _cardTop = null;
  JobInfo _card1 = null;
  JobInfo _card2 = null;
  JobInfo _card3 = null;
  JobInfo _card4 = null;
  JobInfo _card5 = null;
  JobInfo _card6 = null;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isJobInfosLoaded) {
//          debugPrint("]-----] state.club [-----[ ${state.jobInfos[0].title}");
          if (state.jobInfos.length > 0) {
            _card1 = state.jobInfos[0];
            if (state.jobInfos.length > 1) {
              _card2 = state.jobInfos[1];
            }
            if (state.jobInfos.length > 2) {
              _card3 = state.jobInfos[2];
            }
            if (state.jobInfos.length > 3) {
              _card4 = state.jobInfos[3];
            }
            if (state.jobInfos.length > 4) {
              _card5 = state.jobInfos[4];
            }
            if (state.jobInfos.length > 5) {
              _card6 = state.jobInfos[5];
            }
          }
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            decoration: BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "지금 지원하세요!",
                  style: const TextStyle(
                    color: Color.fromRGBO(74, 74, 74, 1),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0,
                  ),
                ),
//                _cardTop != null
//                    ? Padding(
//                        padding: const EdgeInsets.only(top: 15.0),
//                        child: Container(
//                          width: MediaQuery.of(context).size.width,
//                          child: Column(
//                            children: <Widget>[
//                              Stack(children: <Widget>[
//                                Container(
//                                  height: 130.0,
//                                  decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                      fit: BoxFit.fill,
//                                      image: _cardTop.club.mediaCollections
//                                                  .length >
//                                              0
//                                          ? CachedNetworkImageProvider(_cardTop
//                                              .club
//                                              .mediaCollections[0]
//                                              .fullPathS3)
//                                          : AssetImage(
//                                              'assets/images/dump/depositphotos108597720StockPhotoFootballStadiumBackground@3x.png'),
//                                    ),
//                                  ),
//                                ),
//                                Positioned(
//                                  top: 5.0,
//                                  right: 6.0,
//                                  child: Container(
//                                    child: Center(
//                                      child: Row(
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.center,
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          Image(
//                                            image: AssetImage(
//                                                'assets/images/icons/filledHeart341288@3x.png'),
//                                            width: 12,
//                                          ),
//                                          Padding(
//                                            padding: const EdgeInsets.only(
//                                                left: 2.0),
//                                            child: Text(
//                                              "55",
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontSize: 10),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ]),
//                              Container(
//                                padding: EdgeInsets.only(
//                                    top: 10.0,
//                                    bottom: 10.0,
//                                    left: 8.0,
//                                    right: 10.0),
//                                decoration: BoxDecoration(color: Colors.white),
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: <Widget>[
//                                    CachedNetworkImage(
//                                      height: 37.0,
//                                      width: 37.0,
//                                      imageUrl: _cardTop.club.symbolImageUrl,
//                                      placeholder: (context, url) =>
//                                          new CircularProgressIndicator(),
//                                      errorWidget: (context, url, error) =>
//                                          new Icon(Icons.error),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 8.0),
//                                      child: Column(
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text(
//                                            _cardTop.club.name,
//                                            style: const TextStyle(
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.w400,
//                                              fontFamily: "NotoSansCJKkr-Bold",
//                                              fontStyle: FontStyle.normal,
//                                              fontSize: 14.0,
//                                            ),
//                                          ),
//                                          Text(
//                                            _cardTop.club.localName,
//                                            style: const TextStyle(
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.w400,
//                                              fontFamily:
//                                                  "NotoSansCJKkr-Regular",
//                                              fontStyle: FontStyle.normal,
//                                              fontSize: 11.0,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      )
//                    : Text(""),
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _card1 != null
                          ? HomeApplyNowCard(jobInfo: _card1)
                          : Text(""),
                      _card2 != null
                          ? HomeApplyNowCard(jobInfo: _card2)
                          : Text(""),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _card3 != null
                          ? HomeApplyNowCard(jobInfo: _card3)
                          : Text(""),
                      _card4 != null
                          ? HomeApplyNowCard(jobInfo: _card4)
                          : Text(""),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _card5 != null
                          ? HomeApplyNowCard(jobInfo: _card5)
                          : Text(""),
                      _card6 != null
                          ? HomeApplyNowCard(jobInfo: _card6)
                          : Text(""),
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
