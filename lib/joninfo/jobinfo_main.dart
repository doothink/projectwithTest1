import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          )
                        ],
                      ),
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
