import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/models.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc _authenticationBloc;

  HomeBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeState get initialState => HomeState.empty();

  @override
  Stream<HomeState> transformEvents(
    Stream<HomeEvent> events,
    Stream<HomeState> Function(HomeEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<HomeEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    print("]-----] MembersTopLoad event [-----[ ${event}");
    if (event is JobInfosLoad) {
      yield* _mapJobInfosLoadToState(event.size);
    } else if (event is JobInfosEmpty) {
      yield* _mapJobInfosEmptyToState();
    }
  }

  Stream<HomeState> _mapJobInfosLoadToState(int size) async* {
    yield HomeState.jobInfosLoading();
    try {
      final response = await _authenticationBloc.get('/api/jobinfomain');
      final contents = response['content'] as List;
      final List<JobInfo> jobInfos = contents.map((data) {
        return JobInfo.fromJson(data);
      }).toList();
      print("]-----] _mapJobInfosLoadToState.jobInfos [-----[ ${jobInfos}");
      yield state.jobInfosLoaedSuccess(jobInfos: jobInfos);
    } catch (error) {
      print("]-----] _mapJobInfosLoadToState.error [-----[ ${error}");
      yield HomeState.jobInfosLoadFailure();
    }
  }

  Stream<HomeState> _mapJobInfosEmptyToState() async* {
    yield HomeState.jobInfosEmpty();
  }
}
