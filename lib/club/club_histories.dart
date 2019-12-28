import 'package:flutter/material.dart';
import 'package:with_flutter/model/club.dart';

class ClubHistories extends StatelessWidget {
  final Club _club;

  ClubHistories({
    Key key,
    @required Club club,
  })  : assert(club != null),
        _club = club,
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
          Text("주요 경력",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr-Bold",
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              )),
          _club.clubHistories != null && _club.clubHistories.length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _club.clubHistories.map((item) {
                    return Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        "• ${item.title}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Text(
                  "",
                  style: TextStyle(height: 0),
                ),
        ],
      ),
    );
  }
}
