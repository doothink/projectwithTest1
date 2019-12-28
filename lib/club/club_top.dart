import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/model/club.dart';

import 'club_top_banner.dart';

class ClubTop extends StatelessWidget {
  final Club _club;

  ClubTop({
    Key key,
    @required Club club,
  })  : assert(club != null),
        _club = club,
        super(key: key);

  final double topWidgetHeight = 220.0;
  final double avatarRadius = 45.0;
  final double avatarWrapRadius = 46.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Column(
          children: <Widget>[
            ClubTopBanner(
              mediaCollections: _club.mediaCollections,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: avatarRadius * 3, top: 10.0, right: 10.0),
//                            width: MediaQuery.of(context).size.width ,
              height: 100,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Text(
                                _club.name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        _club.localName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  )),
                  Container(
                      child: Row(
                    children: <Widget>[
//                      Text("Follow"),
                    ],
                  )),
                ],
              ),
            )
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
                          "구단정보",
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
        Positioned(
          child: CircleAvatar(
            radius: avatarWrapRadius,
            backgroundColor: Color.fromRGBO(226, 226, 226, 1),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: _club.symbolImageUrl != null
                    ? CachedNetworkImage(
                        height: 80.0,
                        width: 80.0,
                        imageUrl: _club.symbolImageUrl,
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      )
                    : Text(""),
              ),
              radius: avatarRadius,
            ),
          ),
          left: (MediaQuery.of(context).size.width / 6) - avatarRadius,
          top: topWidgetHeight - avatarRadius / 3,
        )
      ]),
    );
  }
}
