import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/mypage/mypage.dart';

class MypageAddConfiguration extends StatefulWidget {
  @override
  MypageAddConfiguration({
    Key key,
  }) : super(key: key);

  State<MypageAddConfiguration> createState() => MypageAddConfigurationState();
}

class MypageAddConfigurationState extends State<MypageAddConfiguration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPageScreen()),
                );
              }),
        ],
        title: Text('설정'),
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "버전정보 ver.1.0.3",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      "최신버전",
                      style: const TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "비밀번호 재설정",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: FlatButton(
                        child: Image.asset("assets/images/icons/arrow-down@3x.png",width: 15,height: 15),
                        onPressed: () {

                        },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "알림 설정",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: SwitchWidget()

                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "최근 검색어 표시",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: SwitchWidget()
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "캐시삭제",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      "삭제",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "버그 리포트",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "비트베리 연동끊기",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "회원탈퇴",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38,width: 1.0),
                ),
              ),
            ),
          ],
        )
    );
  }
}


////토클
class SwitchWidget extends StatefulWidget {
  @override
  SwitchWidgetClass createState() => new SwitchWidgetClass();
}

class SwitchWidgetClass extends State {

  bool switchControl = false;
//  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(switchControl == false)
    {
      setState(() {
        switchControl = true;
//        textHolder = 'Switch is ON';
      });
//      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    }
    else
    {
      setState(() {
        switchControl = false;
//        textHolder = 'Switch is OFF';
      });
//      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 1.0,
            child: Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            )
        ),

//          Text('$textHolder', style: TextStyle(fontSize: 24),)

        ]);
  }
}

////토클 끝
