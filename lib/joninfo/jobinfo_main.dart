import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'bloc/bloc.dart';
import 'jobinfo_club_intro.dart';
import 'jobinfo_qualification.dart';
import 'jobinfo_title.dart';
import 'jobinfo_top.dart';

class JobInfoMain extends StatefulWidget {
  final int _jobInfoId;

  JobInfoMain({Key key, @required int jobInfoId})
      : assert(jobInfoId != null),
        _jobInfoId = jobInfoId,
        super(key: key);

  @override
  State<JobInfoMain> createState() => _JobInfoMainState();
}

class _JobInfoMainState extends State<JobInfoMain> {
  JobInfoBloc _jobInfoBloc;

  int get _jobInfoId => widget._jobInfoId;
  JobInfo _jobInfo;

  @override
  void initState() {
    super.initState();

    _jobInfoBloc = BlocProvider.of<JobInfoBloc>(context);
    _jobInfoBloc.add(JobInfoLoad(jobInfoId: _jobInfoId));
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint(
//        "]-----] JobInfoMain::build.description [-----[ ${_jobInfo.club.description}");
    return BlocListener<JobInfoBloc, JobInfoState>(
      listener: (context, state) {
        if (state.isLoaded) {
          _jobInfo = state.jobInfo;
        }
        if (state.isLoading) {
          _loadingDialog(context);
        }
        if (state.isSaved) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      child: BlocBuilder<JobInfoBloc, JobInfoState>(
        builder: (context, state) {
          return _jobInfo != null
              ? Container(
                  child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Column(
                        children: <Widget>[
                          JobInfoTop(
                            jobInfo: _jobInfo,
                          ),
                          JobInfoTitle(
                            jobInfo: _jobInfo,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: JobInfoClubIntro(
                              description: _jobInfo.club.description,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: JobInfoQualification(
                              jobInfo: _jobInfo,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: FlatButton(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(),
                              color: Color.fromRGBO(48, 190, 157, 1),
                              onPressed: () {
                                _jobInfoBloc
                                    .add(JobInfoSave(jobInfoId: _jobInfoId));
                              },
                              child: Text(
                                "지원하기",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Medium",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : EmptyWidget();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadingDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("처리중"),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
