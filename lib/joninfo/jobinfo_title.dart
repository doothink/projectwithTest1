import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/jobinfo_util.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'bloc/bloc.dart';
import 'bloc/jobinfo_bloc.dart';
import 'jobinfo_hashtag.dart';

class JobInfoTitle extends StatefulWidget {
  final JobInfo _jobInfo;

  JobInfoTitle({
    Key key,
    @required JobInfo jobInfo,
  })  : assert(jobInfo != null),
        _jobInfo = jobInfo,
        super(key: key);

  @override
  _JobInfoTitleState createState() => _JobInfoTitleState();
}

class _JobInfoTitleState extends State<JobInfoTitle> {
  JobInfoBloc _jobInfoBloc;

  JobInfo get _jobInfo => widget._jobInfo;
  bool _isHeart = false;
  int _heartCount;

  @override
  void initState() {
    super.initState();
    _jobInfoBloc = BlocProvider.of<JobInfoBloc>(context);
    _isHeart = _jobInfo.isHearted;
    _heartCount = _jobInfo.heartCount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobInfoBloc, JobInfoState>(
      listener: (context, state) {
        if (state.isHeartSuccess || state.isHeartDeleteSuccess) {
          setState(() {
            if (state.isHeart != null) {
              _isHeart = state.isHeart;
            }

            _heartCount = state.heartCount;
          });
        }
      },
      child: BlocBuilder<JobInfoBloc, JobInfoState>(builder: (context, state) {
        print("=============[ ${_jobInfo.isHearted}");

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Text(
                                widget._jobInfo.title,
                                style: const TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "${widget._jobInfo.club.name} | ${widget._jobInfo.club.localName}",
                        style: const TextStyle(
                          color: Color.fromRGBO(74, 74, 74, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: GestureDetector(
                      onTap: () {
                        if (_isHeart == true) {
                          _jobInfoBloc
                              .add(JobInfoHeartDelete(jobInfoId: _jobInfo.id));
                        } else {
                          _jobInfoBloc
                              .add(JobInfoHeartSave(jobInfoId: _jobInfo.id));
                        }
                      },
                      child: _isHeart != null && _isHeart == true
                          ? Container(
                              width: 65,
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, right: 12, left: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 94, 139, 1),
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(40.0))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    _heartCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/icons/jobinfo-heart-nonactive@3x.png'),
                                width: 30,
                                height: 30,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: JobInfoHashTag(
                  hashTag: widget._jobInfo.club.hashTags,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "모집기간",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        makeJobInfoDate(
                            widget._jobInfo.startedAt, widget._jobInfo.endedAt),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
