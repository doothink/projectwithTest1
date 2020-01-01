import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/login/bloc/bloc.dart';
import 'package:with_flutter/noticedetail/notice_detail_screen.dart';

import 'bloc_notice/bloc.dart';

class HomeTopBanner extends StatefulWidget {
  HomeTopBanner({
    Key key,
  }) : super(key: key);

  State<HomeTopBanner> createState() => _HomeTopBannerState();
}

class _HomeTopBannerState extends State<HomeTopBanner> {
  HomeNoticeBloc _homeNoticeBloc;

  @override
  void initState() {
    super.initState();
    _homeNoticeBloc = HomeNoticeBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    _homeNoticeBloc.add(NoticesLoad(size: 3));
  }

  final _controllerTopBanner = PageController();

  List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
//    final List<Widget> _pages = <Widget>[
//      Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            fit: BoxFit.fill,
//            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
//          ),
//        ),
//      ),
//      Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            fit: BoxFit.fill,
//            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
//          ),
//        ),
//      ),
//      Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            fit: BoxFit.fill,
//            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
//          ),
//        ),
//      ),
//    ];
    return BlocProvider<HomeNoticeBloc>(
      builder: (context) => _homeNoticeBloc,
      child: BlocListener<HomeNoticeBloc, HomeNoticeState>(
        listener: (context, state) {
          if (state.isLoaded) {
            if (state.notices != null) {
              if (state.notices.length > 0) {
                List<Widget> _pagesTmp = [];
                for (int i = 0; i < state.notices.length; i++) {
                  _pagesTmp.add(
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoticeDetailScreen(
                                    noticeId: state.notices[i].id,
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(state
                                .notices[i].mediaCollections[0].fullPathS3),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                setState(() {
                  _pages = _pagesTmp;
                });
              }
            }
          }
        },
        child: BlocBuilder<HomeNoticeBloc, HomeNoticeState>(
          builder: (context, state) {
            return _pages != null && _pages.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 165.0,
                    child: Stack(
                      children: <Widget>[
                        PageView(
                          controller: _controllerTopBanner,
                          physics: AlwaysScrollableScrollPhysics(),
                          children: _pages,
                          scrollDirection: Axis.horizontal,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
//                      color: Colors.grey[800].withOpacity(0.4),
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Center(
                              child: DotsIndicator(
                                controller: _controllerTopBanner,
                                itemCount: _pages.length,
                                onPageSelected: (int page) {
                                  _controllerTopBanner.animateToPage(
                                    page,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: LoadingIndicator(),
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
