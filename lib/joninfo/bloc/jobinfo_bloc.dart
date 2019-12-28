import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'bloc.dart';

class JobInfoBloc extends Bloc<JobInfoEvent, JobInfoState> {
  final AuthenticationBloc _authenticationBloc;

  JobInfoBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  JobInfoState get initialState => JobInfoState.empty();

  @override
  Stream<JobInfoState> transformEvents(
    Stream<JobInfoEvent> events,
    Stream<JobInfoState> Function(JobInfoEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<JobInfoEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<JobInfoState> mapEventToState(JobInfoEvent event) async* {
    if (event is JobInfoLoad) {
      yield* _mapJobInfoLoadToState(event.jobInfoId);
    }
  }

  Stream<JobInfoState> _mapJobInfoLoadToState(int jobInfoId) async* {
    yield JobInfoState.loading();
    try {
      final response = await _authenticationBloc.get('/api/jobinfo/$jobInfoId');
//      print("]-----] _mapJobInfoLoadToState::response [-----[ ${response}");
      if (response != null) {
        final jobInfo = JobInfo.fromJson(response);
        yield JobInfoState.success(jobInfo);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield JobInfoState.failure();
    }
  }
}
