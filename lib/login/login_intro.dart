
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/login/login.dart';
import 'package:with_flutter/common/common.dart';

import 'login_intro_first.dart';
import 'login_intro_second.dart';

class LoginIntro extends StatefulWidget {
  LoginIntro({
    Key key,
  }) : super(key: key);

  State<LoginIntro> createState() => _LoginIntroState();
}

class _LoginIntroState extends State<LoginIntro> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  final _controller = PageController();

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      LoginIntroFirst(controller: _controller),
      LoginIntroSecond(controller: _controller),
      LoginForm(),
    ];
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isRegisterd){
          _controller.jumpToPage(2);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: IconTheme(
              data: IconThemeData(color: _kArrowColor),
              child: Stack(
                children: <Widget>[
//                  PageView.builder(
//                    physics: AlwaysScrollableScrollPhysics(),
//                    controller: _controller,
//                    itemBuilder: (BuildContext context, int index) {
//                      return _pages[index % _pages.length];
//                    },
//                  ),
                  PageView(
                    controller: _controller,
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
                          controller: _controller,
                          itemCount: _pages.length,
                          onPageSelected: (int page) {
                            _controller.animateToPage(
                              page,
                              duration: _kDuration,
                              curve: _kCurve,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

