import 'package:flutter/material.dart';
import 'package:with_flutter/model/club.dart';

class ClubMember extends StatelessWidget {
  final Club _club;

  ClubMember({
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
          Text("선수단",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr-Bold",
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              )),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text("• 주장 : ${_club.captainName}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr-Regular",
                  fontStyle: FontStyle.normal,
                  fontSize: 13.0,
                )),
          ),
          _club.clubMemberInfos != null && _club.clubMemberInfos.length > 0
              ? Column(
                  children: <Widget>[
                    Text("• 선수단 구성",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _club.clubMemberInfos.map((item) {
                        return Container(
                          margin: EdgeInsets.only(top: 6),
                          child: Text(
                            "${item.positionType.positionName}: ${item.memberCount}명",
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
                    ),
                  ],
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
