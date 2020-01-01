import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/jobInfoApply.dart';

import 'bloc.dart';

class JobInfoApplyBloc extends Bloc<JobInfoApplyEvent, JobInfoApplyState> {
  final AuthenticationBloc _authenticationBloc;

  JobInfoApplyBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  JobInfoApplyState get initialState => JobInfoApplyState.empty();

  @override
  Stream<JobInfoApplyState> transformEvents(
    Stream<JobInfoApplyEvent> events,
    Stream<JobInfoApplyState> Function(JobInfoApplyEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<JobInfoApplyEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<JobInfoApplyState> mapEventToState(JobInfoApplyEvent event) async* {
    if (event is JobInfoApplyLoad) {
      yield* _mapJobInfoApplysLoadToState();
    }
  }

  Stream<JobInfoApplyState> _mapJobInfoApplysLoadToState() async* {
    if (!state.isLoading && !state.stateHasReachedMax) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc
            .get('/api/jobinfoapply?page=${state.pageIndex + 1}');
        if (response != null) {
          final contents = response['content'] as List;
          final pageIndex = response['pageable']['pageNumber'];
          final last = response['last'];
          final List<JobInfoApply> jobInfoApplies = contents.map((data) {
            return JobInfoApply.fromJson(data);
          }).toList();
          yield state.loaedSuccess(
            jobInfoApplies: state.jobInfoApplies != null
                ? state.jobInfoApplies + jobInfoApplies
                : jobInfoApplies,
            pageIndex: pageIndex + 1,
            hasReachedMax: last,
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield JobInfoApplyState.failure();
      }
    }
  }
}
