import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/jobInfoHeart.dart';
import 'package:with_flutter/searchresult/search_result_jobinfo_card.dart';

import 'bloc/bloc.dart';
import 'jobinfo_heart_card.dart';

class JobInfoHeartMain extends StatefulWidget {
  JobInfoHeartMain({
    Key key,
  }) : super(key: key);

  @override
  State<JobInfoHeartMain> createState() => _JobInfoHeartMainState();
}

class _JobInfoHeartMainState extends State<JobInfoHeartMain> {
  JobInfoHeartBloc _jobInfoHeartBloc;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _jobInfoHeartBloc = BlocProvider.of<JobInfoHeartBloc>(context);
    _jobInfoHeartBloc.add(JobInfoHeartLoad());
  }

  List<JobInfoHeart> _jobInfoHearts;

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobInfoHeartBloc, JobInfoHeartState>(
      listener: (context, state) {
        if (state.isLoaded) {
          debugPrint("======== ${state.jobInfoHearts.length}");
          setState(() {
            _jobInfoHearts = state.jobInfoHearts;
          });
        }
      },
      child: BlocBuilder<JobInfoHeartBloc, JobInfoHeartState>(
        builder: (context, state) {
          return _jobInfoHearts != null
              ? Container(
                  width: MediaQuery.of(context).size.width,
//                  alignment: Alignment.centerLeft,
                  child: GridView.count(
                    controller: _scrollController,
                    shrinkWrap: true,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    crossAxisCount: 2,

                    children: List.generate(
                      _jobInfoHearts != null
                          ? state.hasReachedMax
                              ? _jobInfoHearts.length
                              : _jobInfoHearts.length + 1
                          : 0,
                      (index) => index >= _jobInfoHearts.length
                          ? BottomLoader()
                          : SearchResultJobInfoCard(
                              jobInfo: _jobInfoHearts[index].jobInfo,
                            ),
                    ),
//
                  ),
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
    print("call");
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _jobInfoHeartBloc.add(JobInfoHeartLoad());
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
