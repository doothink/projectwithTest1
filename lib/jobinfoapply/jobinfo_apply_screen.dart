import 'package:flutter/material.dart';

class JobInfoApplyScreen extends StatefulWidget {
  final int _jobInfoId;

  JobInfoApplyScreen({Key key, @required int jobInfoId})
      : assert(jobInfoId != null),
        _jobInfoId = jobInfoId,
        super(key: key);

  @override
  State<JobInfoApplyScreen> createState() => _JobInfoApplyScreenState();
}

class _JobInfoApplyScreenState extends State<JobInfoApplyScreen> {
  int get _jobInfoId => widget._jobInfoId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Text("apply"),
    );
  }
}
