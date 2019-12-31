import 'dart:async';
import 'dart:convert';

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
    } else if (event is JobInfoSave) {
      yield* _mapJobInfoSaveToState(event.jobInfoId);
    } else if (event is JobInfoHeartSave) {
      yield* _mapJobInfoHeartSaveToState(event.jobInfoId);
    } else if (event is JobInfoHeartDelete) {
      yield* _mapJobInfoHeartDeleteToState(event.jobInfoId);
    }
  }

  Stream<JobInfoState> _mapJobInfoLoadToState(int jobInfoId) async* {
    yield JobInfoState.loading();
    try {
      final response = await _authenticationBloc.get('/api/jobinfo/$jobInfoId');
      if (response != null) {
        final jobInfo = JobInfo.fromJson(response);
        yield JobInfoState.success(jobInfo);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield JobInfoState.failure();
    }
  }

  Stream<JobInfoState> _mapJobInfoSaveToState(int jobInfoId) async* {
    yield state.updateLoading(isLoading: true);
    try {
      String body = json.encode({
        "jobInfoId": jobInfoId,
      });
      final response =
          await _authenticationBloc.post('/api/jobinfoapply', body);
      if (response != null) {
        yield state.updateSave();
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield JobInfoState.failure();
    }
  }

  Stream<JobInfoState> _mapJobInfoHeartSaveToState(int jobInfoId) async* {
    try {
      String body = json.encode({
        "jobInfoId": jobInfoId,
      });
      final response =
          await _authenticationBloc.post('/api/jobinfoheart', body);
      if (response != null) {
//        print("]-----] response [-----[ ${response}");
        yield state.updateHeart(isHeart: true, heartCount: response);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield JobInfoState.failure();
    }
  }

  Stream<JobInfoState> _mapJobInfoHeartDeleteToState(int jobInfoId) async* {
    try {
      final response =
          await _authenticationBloc.delete('/api/jobinfoheart/$jobInfoId');
      if (response != null) {
//        print("]-----] response [-----[ ${response}");
        yield state.updateHeartDelete(isHeart: false, heartCount: response);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield JobInfoState.failure();
    }
  }
}
