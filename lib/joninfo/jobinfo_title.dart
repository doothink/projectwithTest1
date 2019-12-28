import 'package:flutter/material.dart';
import 'package:with_flutter/common/jobinfo_util.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'jobinfo_hashtag.dart';

class JobInfoTitle extends StatelessWidget {
  final JobInfo _jobInfo;

  JobInfoTitle({
    Key key,
    @required JobInfo jobInfo,
  })  : assert(jobInfo != null),
        _jobInfo = jobInfo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Text(
                            _jobInfo.title,
                            style: const TextStyle(
                              color: Color.fromRGBO(74, 74, 74, 1),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "${_jobInfo.club.name} | ${_jobInfo.club.localName}",
                    style: const TextStyle(
                      color: Color.fromRGBO(74, 74, 74, 1),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Regular",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image(
                  image: AssetImage(
                      'assets/images/icons/jobinfo-heart-nonactive@3x.png'),
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: JobInfoHashTag(
              hashTag: _jobInfo.club.hashTags,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "모집기간",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 13.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    makeJobInfoDate(_jobInfo.startedAt, _jobInfo.endedAt),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Regular",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}
