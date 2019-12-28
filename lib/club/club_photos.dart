import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/model/mediaCollection.dart';

class ClubPhotos extends StatelessWidget {
  final List<MediaCollection> _mediaCollections;

  ClubPhotos({
    Key key,
    @required List<MediaCollection> mediaCollections,
  })  : assert(mediaCollections != null),
        _mediaCollections = mediaCollections,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("구장 사진",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr-Bold",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _mediaCollections.map((item) {
                    print(item.fullPathS3);
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 130.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(item.fullPathS3),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
