import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/jobInfoHeart.dart';

import 'bloc.dart';

class JobInfoHeartBloc extends Bloc<JobInfoHeartEvent, JobInfoHeartState> {
  final AuthenticationBloc _authenticationBloc;

  JobInfoHeartBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  JobInfoHeartState get initialState => JobInfoHeartState.empty();

  @override
  Stream<JobInfoHeartState> transformEvents(
    Stream<JobInfoHeartEvent> events,
    Stream<JobInfoHeartState> Function(JobInfoHeartEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<JobInfoHeartEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<JobInfoHeartState> mapEventToState(JobInfoHeartEvent event) async* {
    if (event is JobInfoHeartLoad) {
      yield* _mapJobInfoHeartsLoadToState();
    }
  }

  Stream<JobInfoHeartState> _mapJobInfoHeartsLoadToState() async* {
    print("]-----] _mapJobInfoHeartsLoadToState [-----[ call");
    if (!state.isLoading && !state.stateHasReachedMax) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc
            .get('/api/jobinfoheart?page=${state.pageIndex + 1}');
        print("]-----] _mapJobInfoHeartsLoadToStat.response [-----[ ${response}");
        if (response != null) {
          final contents = response['content'] as List;
          final pageIndex = response['pageable']['pageNumber'];
          final last = response['last'];
          final List<JobInfoHeart> jobInfoHearts = contents.map((data) {
            return JobInfoHeart.fromJson(data);
          }).toList();
          yield state.loaedSuccess(
            jobInfoHearts: state.jobInfoHearts != null
                ? state.jobInfoHearts + jobInfoHearts
                : jobInfoHearts,
            pageIndex: pageIndex + 1,
            hasReachedMax: last,
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield JobInfoHeartState.failure();
      }
    }
  }
}
