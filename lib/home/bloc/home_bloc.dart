import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/jobInfo.dart';

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
    if (event is JobInfosLoad) {
      yield* _mapJobInfosLoadToState(event.size);
    }
    if (event is JobInfosEmpty) {
      yield* _mapJobInfosEmptyToState();
    }
  }

  Stream<HomeState> _mapJobInfosLoadToState(int size) async* {
//    print("]-----] _mapJobInfosLoadToState.size [-----[ ${size}");
    yield HomeState.jobInfosLoading();
    try {
      final response =
          await _authenticationBloc.get('/api/jobinfo?page=1&pageSize=$size');
//          await _authenticationBloc.get('/api/jobinfo?page=1&pageSize=$size');

      final contents = response['content'] as List;
//      print("]-----] _mapJobInfosLoadToState.response [-----[ ${contents}");
      final List<JobInfo> jobInfos = contents.map((data) {
        return JobInfo.fromJson(data);
      }).toList();
      print("]-----] _mapJobInfosLoadToState.jobInfos [-----[ ${jobInfos}");
      yield HomeState.jobInfosLoadSuccess(jobInfos);
    } catch (error) {
            print("]-----] _mapJobInfosLoadToState.error [-----[ ${error}");
      yield HomeState.jobInfosLoadFailure();
    }
  }

  Stream<HomeState> _mapJobInfosEmptyToState() async* {
    yield HomeState.jobInfosEmpty();
  }
}
