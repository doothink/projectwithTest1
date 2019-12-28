import 'package:flutter/material.dart';

class ClubDescription extends StatelessWidget {
  final String _description;

  ClubDescription({
    Key key,
    @required String description,
  })  : assert(description != null),
        _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("구단 정보",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr-Bold",
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              )),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(_description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Regular",
                    fontStyle: FontStyle.normal,
                    fontSize: 13.0,
                  )))
        ],
      ),
    );
  }
}
