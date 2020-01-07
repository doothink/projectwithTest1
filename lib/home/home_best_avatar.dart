import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/model/member.dart';
import 'package:with_flutter/profile_view/profile_view_screen.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileViewScreen(
                          memberId: _member.id,
                        )),
              );
            },
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: _member != null &&
                          _member.memberProfile != null &&
                          _member.memberProfile.mediaCollections != null &&
                          _member.memberProfile.mediaCollections.length > 0
                      ? CachedNetworkImageProvider(
                          _member.memberProfile.mediaCollections[0].fullPathS3)
                      : AssetImage('assets/images/nophoto@3x.png'),
                  width: 43,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              _member.nickName != null
                  ? "${_member.nickName}"
                  : _member.firstName,
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}
