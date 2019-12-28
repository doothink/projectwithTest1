import 'package:flutter/material.dart';
import 'package:with_flutter/common/jobinfo_util.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'jobinfo_hashtag.dart';

class JobInfoClubIntro extends StatelessWidget {
  final String _description;

  JobInfoClubIntro({
    Key key,
    @required String description,
  })  : assert(description != null),
        _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),

      padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "소개",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr-Bold",
              fontStyle: FontStyle.normal,
              fontSize: 15.0,
            ),
          ),
          Text(
            _description,
            maxLines: 30,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr-Regular",
              fontStyle: FontStyle.normal,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
