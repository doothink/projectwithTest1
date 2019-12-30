import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/home/home_apply_screen.dart';

class HomeMain extends StatelessWidget {
  HomeMain({
    Key key,
  }) : super(key: key);

//  State<HomeMain> createState() => _HomeMainState();
//}
//
//class _HomeMainState extends State<HomeMain> {
//  HomeBloc _homeBloc;

//  @override
//  void initState() {
//    super.initState();
//
//    _homeBloc = HomeBloc(
//        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
//  }

  @override
  Widget build(BuildContext context) {
//    return BlocBuilder<HomeBloc, HomeState>(
//      builder: (context, state) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeTopBanner(),
                HomeRecommendation(),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: HomeApplyScreen(),
                ),
                HomeBestEleven(),
                HomeHotTopic(),
              ],
            )),
      ),
    );
//      },
//    );
  }

//  @override
//  void dispose() {
//    super.dispose();
//  }
}
