import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/notice.dart';

import 'bloc.dart';

class HomeNoticeBloc extends Bloc<HomeNoticeEvent, HomeNoticeState> {
  final AuthenticationBloc _authenticationBloc;

  HomeNoticeBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeNoticeState get initialState => HomeNoticeState.empty();

  @override
  Stream<HomeNoticeState> transformEvents(
    Stream<HomeNoticeEvent> events,
    Stream<HomeNoticeState> Function(HomeNoticeEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<HomeNoticeEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeNoticeState> mapEventToState(HomeNoticeEvent event) async* {
    if (event is NoticesLoad) {
      yield* _mapNoticesLoadToState(event.size);
    }
  }

  Stream<HomeNoticeState> _mapNoticesLoadToState(int size) async* {
//    print("]-----] _mapNoticesLoadToState.size [-----[ ${size}");
    try {
      final response =
          await _authenticationBloc.get('/api/notice?pageSize=$size');
      final contents = response['content'] as List;
      final List<Notice> notices = contents.map((data) {
        return Notice.fromJson(data);
      }).toList();

      yield HomeNoticeState.loaedSuccess(notices);
    } catch (error) {
      print("]-----] _mapNoticesLoadToState.error [-----[ ${error}");
      yield HomeNoticeState.failure();
    }
  }
}
