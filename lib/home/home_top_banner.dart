import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/login/bloc/bloc.dart';

class HomeTopBanner extends StatefulWidget {
  HomeTopBanner({
    Key key,
  }) : super(key: key);

  State<HomeTopBanner> createState() => _HomeTopBannerState();
}

class _HomeTopBannerState extends State<HomeTopBanner> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  final _controllerTopBanner = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/dump/13432415413251@3x.png'),
          ),
        ),
      ),
    ];
    return BlocProvider<HomeBloc>(
      builder: (context) => _homeBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Container(
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
