import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'jobinfo.dart';


class JobInfoScreen extends StatefulWidget {
  final int _jobInfoId;

  JobInfoScreen({Key key, @required int jobInfoId})
      : assert(jobInfoId != null),
        _jobInfoId = jobInfoId,
        super(key: key);

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  int get _jobInfoId => widget._jobInfoId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey.withOpacity(0.1),
      body: BlocProvider<JobInfoBloc>(
          builder: (context) => JobInfoBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: SingleChildScrollView(
            child: JobInfoMain(
              jobInfoId: _jobInfoId,
            ),
          )),
    );
  }
}
