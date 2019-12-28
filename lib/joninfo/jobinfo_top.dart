import 'package:flutter/material.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'jobinfo_top_banner.dart';

class JobInfoTop extends StatelessWidget {
  final JobInfo _jobInfo;

  JobInfoTop({
    Key key,
    @required JobInfo jobInfo,
  })  : assert(jobInfo != null),
        _jobInfo = jobInfo,
        super(key: key);

  final double topWidgetHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(children: [
        Column(
          children: <Widget>[
            JobInfoTopBanner(
              mediaCollections: _jobInfo.club.mediaCollections,
            ),
          ],
        ),
        Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "구인정보",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
