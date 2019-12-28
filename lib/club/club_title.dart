import 'package:flutter/material.dart';

class ClubTitle extends StatelessWidget {
  final String _title;
  final String _titleBold;

  ClubTitle({
    Key key,
    @required String title,
    @required String titleBold,
  })  : assert(title != null),
        _title = title,
        assert(titleBold != null),
        _titleBold = titleBold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("구단 한줄 요약",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr-Bold",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.format_quote,
                    color: Color(0xffbababa),
                    size: 46.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      _title,
                      style: const TextStyle(
                        color: Color(0xffbababa),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, left: 10),
                    child: Text(
                      _titleBold,
                      style: const TextStyle(
                        color: Color.fromRGBO(48, 190, 157, 1),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "이다",
                      style: const TextStyle(
                        color: Color(0xffbababa),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.format_quote,
                    color: Color(0xffbababa),
                    size: 46.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
