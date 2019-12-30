import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/model/member.dart';

class HomeHomeRecommendationCard extends StatelessWidget {
  final Member _member;

  HomeHomeRecommendationCard({
    Key key,
    @required Member member,
  })  : assert(member != null),
        _member = member,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.22,
            height: 81.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: _member != null &&
                        _member.memberProfile != null &&
                        _member.memberProfile.mediaCollections != null &&
                        _member.memberProfile.mediaCollections.length > 0
                    ? CachedNetworkImageProvider(
                        _member.memberProfile.mediaCollections[0].fullPathS3)
                    : AssetImage(
                        'assets/images/nophoto@3x.png',
                      ),
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
            width: MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              color: _member != null && _member.memberProfile != null
                  ? Color.fromRGBO(48, 190, 157, 1)
                  : Color.fromRGBO(100, 92, 215, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _member != null && _member.memberProfile != null
                      ? "Player"
                      : "Fan",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 10.0,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    _member.nickName != null
                        ? "${_member.nickName}"
                        : _member.firstName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Bold",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Text(
                  "대한민국",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Regular",
                    fontStyle: FontStyle.normal,
                    fontSize: 9.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
