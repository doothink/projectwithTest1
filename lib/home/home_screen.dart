import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/feed/feed.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/profile/profile.dart';
import 'package:with_flutter/search/search.dart';
import 'package:with_flutter/wallet/wallet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Widget home = SvgPicture.asset(
    'assets/images/icons/navi-home.svg',
    color: Color.fromRGBO(147, 147, 147, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );
  final Widget homeActive = SvgPicture.asset(
    'assets/images/icons/navi-home.svg',
    color: Color.fromRGBO(48, 190, 157, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  final Widget search = SvgPicture.asset(
    'assets/images/icons/navi-search.svg',
    color: Color.fromRGBO(147, 147, 147, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  final Widget searchActive = SvgPicture.asset(
    'assets/images/icons/navi-search.svg',
    color: Color.fromRGBO(48, 190, 157, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  final Widget feed = SvgPicture.asset(
    'assets/images/icons/navi-feed.svg',
    color: Color.fromRGBO(147, 147, 147, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );
  final Widget feedActive = SvgPicture.asset(
    'assets/images/icons/navi-feed.svg',
    color: Color.fromRGBO(48, 190, 157, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  final Widget wallet = SvgPicture.asset(
    'assets/images/icons/navi-wallet.svg',
    color: Color.fromRGBO(147, 147, 147, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );
  final Widget walletActive = SvgPicture.asset(
    'assets/images/icons/navi-wallet.svg',
    color: Color.fromRGBO(48, 190, 157, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  final Widget profile = SvgPicture.asset(
    'assets/images/icons/navi-profile.svg',
    color: Color.fromRGBO(147, 147, 147, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );
  final Widget profileActive = SvgPicture.asset(
    'assets/images/icons/navi-profile.svg',
    color: Color.fromRGBO(48, 190, 157, 1),
    semanticsLabel: 'A red up arrow',
    height: 30.0,
    width: 29.8,
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomeMain(),
      SearchScreen(),
      FeedScreen(),
      WalletScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: home,
            activeIcon: homeActive,
            title: Text(
              '홈',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: search,
            activeIcon: searchActive,
            title: Text(
              '탐색',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: feed,
            activeIcon: feedActive,
            title: Text(
              '피드',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: wallet,
            activeIcon: walletActive,
            title: Text(
              '지갑',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: profile,
            activeIcon: profileActive,
            title: Text(
              '내 정보',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
      ),
    );
  }
}
