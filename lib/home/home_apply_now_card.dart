import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/club/club.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/joninfo/jobinfo_screen.dart';
import 'package:with_flutter/model/jobInfo.dart';

class HomeApplyNowCard extends StatefulWidget {
  final JobInfo _jobInfo;

  HomeApplyNowCard({Key key, @required JobInfo jobInfo})
      : assert(jobInfo != null),
        _jobInfo = jobInfo,
        super(key: key);

  State<HomeApplyNowCard> createState() => _HomeApplyNowCardState();
}

class _HomeApplyNowCardState extends State<HomeApplyNowCard> {
  HomeBloc _homeBloc;

  JobInfo get _jobInfo => widget._jobInfo;

  @override
  void initState() {
    super.initState();
//    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
//    return
//      BlocBuilder<HomeBloc, HomeState>(
//      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
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
                Positioned(
                  top: 5.0,
                  right: 6.0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 3.0, bottom: 3.0, left: 5.0, right: 5.0),
                    decoration:
                        BoxDecoration(color: Colors.black12.withOpacity(0.2)),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                                'assets/images/icons/filledHeart341288@3x.png'),
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(
                              _jobInfo.heartCount.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 8.0, right: 10.0),
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
                                fontSize: 12.0,
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
//      },
//    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
