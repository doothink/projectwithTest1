import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/home/bloc_recommendation/bloc.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/models.dart';

import 'home_recommendation_card.dart';

class HomeRecommendation extends StatefulWidget {
  HomeRecommendation({
    Key key,
  }) : super(key: key);

  State<HomeRecommendation> createState() => _HomeRecommendationState();
}

class _HomeRecommendationState extends State<HomeRecommendation> {
  HomeRecommendationBloc _homeRecommendationBloc;

  @override
  void initState() {
    super.initState();
    _homeRecommendationBloc = HomeRecommendationBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    _homeRecommendationBloc.add(MembersTopLoad(size: 4));
  }

  List<Member> _members;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeRecommendationBloc>(
      builder: (context) => _homeRecommendationBloc,
      child: BlocListener<HomeRecommendationBloc, HomeRecommendationState>(
        listener: (context, state) {
          if (state.isMembersTopLoaded) {
            setState(() {
              _members = state.membersTop;
            });
          }
        },
        child: BlocBuilder<HomeRecommendationBloc, HomeRecommendationState>(
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
                    "추천",
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
                    child: _members != null && _members.length > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _members
                                .map((item) => HomeHomeRecommendationCard(
                                      member: item,
                                    ))
                                .toList(),
                          )
                        : EmptyWidget(),
                  ),
                ],
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
