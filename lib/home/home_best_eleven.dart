import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/member.dart';

import 'bloc_best/bloc.dart';
import 'bloc_best/home_best_bloc.dart';
import 'home_best_avatar.dart';

class HomeBestEleven extends StatefulWidget {
  HomeBestEleven({
    Key key,
  }) : super(key: key);

  State<HomeBestEleven> createState() => _HomeBestElevenState();
}

class _HomeBestElevenState extends State<HomeBestEleven> {
  HomeBestBloc _homeBestBloc;

  @override
  void initState() {
    super.initState();
    _homeBestBloc = HomeBestBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    _homeBestBloc.add(MembersLoad(size: 11));
  }

  Member _member1;
  Member _member2;
  Member _member3;
  Member _member4;
  Member _member5;
  Member _member6;
  Member _member7;
  Member _member8;
  Member _member9;
  Member _member10;
  Member _member11;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBestBloc>(
      builder: (context) => _homeBestBloc,
      child: BlocListener<HomeBestBloc, HomeBestState>(
        listener: (context, state) {
          if (state.isLoaded) {
            if (state.members.length > 0) {
              _member1 = state.members[0];
            }
            if (state.members.length > 1) {
              _member2 = state.members[1];
            }
            if (state.members.length > 2) {
              _member3 = state.members[2];
            }
            if (state.members.length > 3) {
              _member4 = state.members[3];
            }
            if (state.members.length > 4) {
              _member5 = state.members[4];
            }
            if (state.members.length > 5) {
              _member6 = state.members[5];
            }
            if (state.members.length > 6) {
              _member7 = state.members[6];
            }
            if (state.members.length > 7) {
              _member8 = state.members[7];
            }
            if (state.members.length > 8) {
              _member9 = state.members[8];
            }
            if (state.members.length > 9) {
              _member10 = state.members[9];
            }
            if (state.members.length > 10) {
              _member11 = state.members[10];
            }
          }
        },
        child: BlocBuilder<HomeBestBloc, HomeBestState>(
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
                            child: _member1 != null
                                ? HomeBestAvatar(
                                    member: _member1,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          right: MediaQuery.of(context).size.width * 0.3,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member2 != null
                                ? HomeBestAvatar(
                                    member: _member2,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 52.0,
                          left: MediaQuery.of(context).size.width * 0.14,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member3 != null
                                ? HomeBestAvatar(
                                    member: _member3,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 52.0,
                          left: MediaQuery.of(context).size.width * 0.416,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member4 != null
                                ? HomeBestAvatar(
                                    member: _member4,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 52.0,
                          right: MediaQuery.of(context).size.width * 0.14,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member5 != null
                                ? HomeBestAvatar(
                                    member: _member5,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 102.0,
                          left: MediaQuery.of(context).size.width * 0.3,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member6 != null
                                ? HomeBestAvatar(
                                    member: _member6,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 102.0,
                          right: MediaQuery.of(context).size.width * 0.3,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member7 != null
                                ? HomeBestAvatar(
                                    member: _member7,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 162.0,
                          left: MediaQuery.of(context).size.width * 0.14,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member8 != null
                                ? HomeBestAvatar(
                                    member: _member8,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 150.0,
                          left: MediaQuery.of(context).size.width * 0.416,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member9 != null
                                ? HomeBestAvatar(
                                    member: _member9,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 162.0,
                          right: MediaQuery.of(context).size.width * 0.14,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member10 != null
                                ? HomeBestAvatar(
                                    member: _member10,
                                  )
                                : EmptyWidget(),
                          ),
                        ),
                        Positioned(
                          top: 220.0,
                          left: MediaQuery.of(context).size.width * 0.416,
                          child: Container(
//                              padding: const EdgeInsets.only(bottom: 20.0),
                            child: _member11 != null
                                ? HomeBestAvatar(
                                    member: _member11,
                                  )
                                : EmptyWidget(),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
