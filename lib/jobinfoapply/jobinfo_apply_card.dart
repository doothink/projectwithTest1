import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/club/club_screen.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/feeddetail/feed_detail.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfoApply.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class JobInfoApplyCard extends StatelessWidget {
  final JobInfoApply _jobInfoApply;

  JobInfoApplyCard({Key key, @required JobInfoApply jobInfoApply})
      : assert(jobInfoApply != null),
        _jobInfoApply = jobInfoApply,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(width: 0.5, color: Color.fromRGBO(124, 124, 124, 1)),
        ),
        color: Color.fromRGBO(248, 248, 248, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 14),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: CircleAvatar(
                    radius: 33.6,
                    backgroundColor: Color.fromRGBO(222, 222, 222, 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33.0,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          height: 64.0,
                          width: 64.0,
                          imageUrl: _jobInfoApply.jobInfo.club.symbolImageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClubScreen(
                                clubId: _jobInfoApply.jobInfo.club.id,
                              )),
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _jobInfoApply.jobInfo.club.name,
                        style: const TextStyle(
                            color: const Color(0xff414141),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _jobInfoApply.jobInfo.title,
                          style: const TextStyle(
                              color: const Color(0xff414141),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                        ),
                      ),
                      Text(
                        '지원일 : ${DateUtils.getApplyTime(_jobInfoApply.createdAt)}',
                        style: const TextStyle(
                            color: const Color(0xffa8a8a8),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _jobInfoApply.status != null
              ? Container(
                  padding: EdgeInsets.only(right: 14),
                  child: Row(
                    crossAxisAlignment: _jobInfoApply.status == 'PASSED' ||
                            _jobInfoApply.status == 'PASSED'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            'assets/images/apply-${_jobInfoApply.status.toLowerCase()}.png'),
                        height: 53.0,
                        width: 53.0,
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(right: 14),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/apply-apply.png'),
                    height: 53.0,
                    width: 53.0,
                  ),
                )
        ],
      ),
    );
  }
}
