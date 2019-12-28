import 'package:flutter/material.dart';

class LoginIntroFirst extends StatelessWidget {
  final PageController _controller;

  LoginIntroFirst({Key key, PageController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          decoration: BoxDecoration(color: Color.fromRGBO(48, 124, 245, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("스포츠",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Bold",
                      fontStyle: FontStyle.normal,
                      fontSize: 40.0),
                  textAlign: TextAlign.left),
              Text("경력관리 플랫폼",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 40.0,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.left),
              Text("위드",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 40.0,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.left),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("여러분의 프로필을 등록하고 스카우팅",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.left),
                    Text("기회와 WINT를 얻으세요",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.left),
                  ],

                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: Container(
//              color: Colors.grey[800].withOpacity(0.4),
              padding:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 30.0),
              child: GestureDetector(
                onTap: () {
                  _controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 10),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  "건너뛰기",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansCJKkr-Medium',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              )),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
//              color: Colors.grey[800].withOpacity(0.4),
              padding:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 30.0),
              child: GestureDetector(
                onTap: () {
                  _controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  "다음",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansCJKkr-Medium',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              )),
        ),
      ]),
    );
  }
}
