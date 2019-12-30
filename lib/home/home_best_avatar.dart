import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/feeddetail/feed_detail.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/member.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeBestAvatar extends StatelessWidget {
  final Member _member;

  HomeBestAvatar({Key key, @required Member member})
      : assert(member != null),
        _member = member,
        super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            child: ClipOval(
              child: Image(
                image: _member != null &&
                    _member.memberProfile !=
                        null &&
                    _member.memberProfile
                        .mediaCollections !=
                        null &&
                    _member
                        .memberProfile
                        .mediaCollections
                        .length >
                        0
                    ? CachedNetworkImageProvider(
                    _member
                        .memberProfile
                        .mediaCollections[0]
                        .fullPathS3)
                    : AssetImage(
                    'assets/images/nophoto@3x.png'),
                width: 43,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              _member.nickName != null
                  ? "${_member.nickName}"
                  : _member.firstName,
              style: TextStyle(
                  color: Colors.white, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}
