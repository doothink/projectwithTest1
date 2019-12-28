import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/club/club.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/club.dart';

import 'club_description.dart';
import 'club_hashtag.dart';
import 'club_histories.dart';
import 'club_jobinfo.dart';
import 'club_member.dart';
import 'club_photos.dart';
import 'club_title.dart';
import 'club_top.dart';

class ClubMain extends StatefulWidget {
  final int _clubId;

  ClubMain({Key key, @required int clubId})
      : assert(clubId != null),
        _clubId = clubId,
        super(key: key);

  @override
  State<ClubMain> createState() => _ClubMainState();
}

class _ClubMainState extends State<ClubMain> {
  ClubBloc _clubBloc;

  int get _clubId => widget._clubId;
  Club _club;

  @override
  void initState() {
    super.initState();

    _clubBloc = BlocProvider.of<ClubBloc>(context);
    _clubBloc.add(ClubLoad(clubId: _clubId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClubBloc, ClubState>(
      listener: (context, state) {
        if (state.isLoaded) {
//          debugPrint("]-----] state.club [-----[ ${state.club.hashTags}");

          _club = state.club;
        }
      },
      child: BlocBuilder<ClubBloc, ClubState>(
        builder: (context, state) {
          return _club != null
              ? Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        ClubTop(club: _club),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 30),
                          child: Column(
                            children: <Widget>[
                              ClubHashTag(hashTag: _club.hashTags),
                              ClubTitle(
                                title: _club.title,
                                titleBold: _club.titleBold,
                              ),
                              ClubJobInfo(
                                jobInfos: _club.jobInfos,
                              ),
                              ClubDescription(description: _club.description),
                              Container(
                                margin: EdgeInsets.only(top: 30.0),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("코칭 스태프",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child:
                                            Text("• 감독 : ${_club.directorName}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      "NotoSansCJKkr-Regular",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13.0,
                                                ))),
                                    Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                            "• 수석코치 : ${_club.headCoachName}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  "NotoSansCJKkr-Regular",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 13.0,
                                            ))),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Text("• 코치 : ${_club.coachNames}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr-Regular",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.0,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              ClubMember(
                                club: _club,
                              ),
                              _club.clubHistories != null &&
                                      _club.clubHistories.length > 0
                                  ? ClubHistories(
                                      club: _club,
                                    )
                                  : EmptyWidget(),
                              _club.subMediaCollections != null &&
                                      _club.subMediaCollections.length > 0
                                  ? ClubPhotos(
                                      mediaCollections:
                                          _club.subMediaCollections,
                                    )
                                  : EmptyWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Text("");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
