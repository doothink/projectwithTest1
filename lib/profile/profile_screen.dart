import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/common/empty.dart';

import 'bloc/bloc.dart';
import 'profile.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scrollController = ScrollController();
  bool isScrollingDown = false;

  ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    _profileBloc = ProfileBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text('내정보'),
        actions: <Widget>[
//          IconButton(
//            icon: Image.asset(
//              'assets/images/icons/profile-top-media@3x.png',
//              width: 40,
//            ),
//            iconSize: 40,
//            onPressed: () {},
//          ),
          IconButton(
            icon: Image.asset(
              'assets/images/icons/profile-top-more@3x.png',
              width: 26,
            ),
            iconSize: 26,
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
          // overflow menu
        ],
      ),
      body: BlocProvider<ProfileBloc>(
          builder: (context) => _profileBloc,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: ProfilePost(),
          )),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('WITH'),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('LogOut'),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
      bottomSheet: isScrollingDown
          ? Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
//              height: 53,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              child: FlatButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                shape: RoundedRectangleBorder(),
                color: Color.fromRGBO(195, 195, 195, 1),
                onPressed: () {
                  _profileBloc
                      .add(ProfileSaveButtonPressed(viewYn: false));
                },
                child: Text(
                  "임시저장",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Medium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              child: FlatButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                shape: RoundedRectangleBorder(),
                color: Color.fromRGBO(48, 190, 157, 1),
                onPressed: () {
                  _profileBloc
                      .add(ProfileSaveButtonPressed(viewYn: true));
                },
                child: Text(
                  "입력완료",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Medium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          : EmptyWidget(),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
//      print("]-----] isScrollingDown [-----[ $isScrollingDown");
      if (!isScrollingDown) {
        setState(() {
          isScrollingDown = true;
        });
      }
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        setState(() {
          isScrollingDown = false;
        });
      }
    }
  }
}
