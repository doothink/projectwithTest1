import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/jobInfoApply.dart';

import 'bloc/bloc.dart';
import 'jobinfo_apply_card.dart';

class JobInfoApplyMain extends StatefulWidget {
  JobInfoApplyMain({
    Key key,
  }) : super(key: key);

  @override
  State<JobInfoApplyMain> createState() => _JobInfoApplyMainState();
}

class _JobInfoApplyMainState extends State<JobInfoApplyMain> {
  JobInfoApplyBloc _jobInfoApplyBloc;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _jobInfoApplyBloc = BlocProvider.of<JobInfoApplyBloc>(context);
    _jobInfoApplyBloc.add(JobInfoApplyLoad());
  }

  List<JobInfoApply> _jobInfoApplies;

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobInfoApplyBloc, JobInfoApplyState>(
      listener: (context, state) {
        if (state.isLoaded) {
          _jobInfoApplies = state.jobInfoApplies;
        }
      },
      child: BlocBuilder<JobInfoApplyBloc, JobInfoApplyState>(
        builder: (context, state) {
          return _jobInfoApplies != null
              ? Container(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: _jobInfoApplies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return JobInfoApplyCard(
                          jobInfoApply: _jobInfoApplies[index],
                        );
                      }),
                )
              : EmptyWidget();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _jobInfoApplyBloc.add(JobInfoApplyLoad());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
