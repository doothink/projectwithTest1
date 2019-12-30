import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:with_flutter/club/club_screen.dart';
import 'package:with_flutter/jobinfoapply/jobinfo_apply_screen.dart';
import 'package:with_flutter/joninfo/jobinfo.dart';
import 'package:with_flutter/model/jobInfo.dart';

class SearchResultJobInfoCard extends StatelessWidget {
  final JobInfo _jobInfo;

  SearchResultJobInfoCard({Key key, JobInfo jobInfo})
      : _jobInfo = jobInfo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 130.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      _jobInfo.club.mediaCollections[0].fullPathS3),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobInfoScreen(
                          jobInfoId: _jobInfo.id,
                        )),
              );
            },
          ),
          Container(
            width: double.infinity,
//            height: 180,
            padding: EdgeInsets.only(
                top: 4.0, bottom: 4.0, left: 8.0, right: 1.0),
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                      child: ClipOval(
                        child: CachedNetworkImage(
                          height: 37.0,
                          width: 37.0,
                          imageUrl: _jobInfo.club.symbolImageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClubScreen(
                                  clubId: _jobInfo.club.id,
                                )),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _jobInfo.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Bold",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          _jobInfo.club.localName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
