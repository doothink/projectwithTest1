import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/jobinfoapply/jobinfo_apply.dart';
import 'package:with_flutter/jobinfoheart/jobinfo_heart.dart';
import 'package:with_flutter/notice/notice.dart';
import 'package:with_flutter/policy/policy_site_screen.dart';

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
//        bottomOpacity: 0.0,
//        elevation: 0.0,
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
          child: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ProfilePost(),
            ),
          )),
      endDrawer: Drawer(
        child: SafeArea(
          child: Container(
            color: Color.fromRGBO(248, 248, 248, 1),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '더보기',
                    style: const TextStyle(
                        color: const Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),
                ),
                Divider(
                  indent: 14,
                  endIndent: 14,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 28),
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/icons/785@3x.png'),
                        width: 22.3,
                        height: 22,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          '공지사항',
                          style: const TextStyle(
                              color: const Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoticeScreen()),
                    );
                  },
                ),
                Divider(
                  indent: 60,
                  endIndent: 20,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 28),
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/icons/779@3x.png'),
                        width: 22.3,
                        height: 22,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          '좋아요 한 공고 보기',
                          style: const TextStyle(
                              color: const Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobInfoHeartScreen()),
                    );
                  },
                ),
                Divider(
                  indent: 60,
                  endIndent: 20,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 28),
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/icons/781@3x.png'),
                        width: 22.3,
                        height: 22,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          '내 지원 현황 보기',
                          style: const TextStyle(
                              color: const Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobInfoApplyScreen()),
                    );
                  },
                ),
                Divider(
                  indent: 60,
                  endIndent: 20,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 28),
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/icons/1895@3x.png'),
                        width: 22.3,
                        height: 22,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          '이용약관',
                          style: const TextStyle(
                              color: const Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PolicySiteScreen()),
                    );
                  },
                ),
                Divider(
                  indent: 60,
                  endIndent: 20,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
                ListTile(
                  title: Text('로그아웃'),
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
        ),
      ),
      bottomSheet: isScrollingDown
          ? Container(
              width: MediaQuery.of(context).size.width,
//              height: 53,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
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
                    width: MediaQuery.of(context).size.width * 0.7,
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
