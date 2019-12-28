import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/feeddetail/feed_detail.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FeedCard extends StatelessWidget {
  final Feed _feed;

  FeedCard({Key key, @required Feed feed})
      : assert(feed != null),
        _feed = feed,
        super(key: key);

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    print(_feed.memberProfile);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
//        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
//              Text("")
              //Center(child: CircularProgressIndicator()),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeedDetailScreen(
                          feedId: _feed.id,
                        )),
                  );
                },
                child: Center(
                  child: _feed != null &&
                          _feed.mediaCollections != null &&
                          _feed.mediaCollections[0] != null
                      ? _feed.mediaCollections[0].mediaType == 'YOUTUBE' &&
                              _feed.mediaCollections[0].fullPath != null
                          ? CachedNetworkImage(
                              imageUrl:
                                  "https://i3.ytimg.com/vi/${YoutubePlayer.convertUrlToId(_feed.mediaCollections[0].fullPath)}/mqdefault.jpg",
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            )
                          : _feed.mediaCollections[0].fullPathS3 != null
                              ? CachedNetworkImage(
                                  imageUrl: _feed.mediaCollections[0].fullPathS3,
                                  placeholder: (context, url) =>
                                      new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                )
                              : Text("")
                      : Text(
                          "",
                          style: TextStyle(height: 0),
                        ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 4, left: 4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Stack(children: [
                          CircleAvatar(
                            radius: 17.5,
                            child: ClipOval(
                              child: _feed != null &&
                                      _feed.memberProfile != null &&
                                      _feed.memberProfile.mediaCollections !=
                                          null &&
                                      _feed.memberProfile.mediaCollections[0] !=
                                          null
                                  ? CachedNetworkImage(
                                      width: 35.0,
                                      height: 35.0,
                                      imageUrl: _feed.memberProfile
                                          .mediaCollections[0].fullPathS3,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    )
                                  : Image.asset(
                                      'assets/images/nophoto@3x.png',
                                      width: 35.0,
                                      height: 35.0,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 4.0,
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${_feed.member.firstName}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(65, 65, 65, 1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:2.0),
                                child: Text(
                                  DateUtils.getCreatedTime(_feed.createdAt),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(152, 152, 152, 1),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 9.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${_feed.title}",
                    style: const TextStyle(
                      color: Color.fromRGBO(152, 152, 152, 1),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Medium",
                      fontStyle: FontStyle.normal,
                      fontSize: 9.0,
                    ),
                    maxLines: 2,
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



final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
