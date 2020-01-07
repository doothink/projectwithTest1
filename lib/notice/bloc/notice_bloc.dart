import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/notice.dart';

import 'bloc.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  final AuthenticationBloc _authenticationBloc;

  NoticeBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  NoticeState get initialState => NoticeState.empty();

  @override
  Stream<NoticeState> transformEvents(
    Stream<NoticeEvent> events,
    Stream<NoticeState> Function(NoticeEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<NoticeEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<NoticeState> mapEventToState(NoticeEvent event) async* {
    if (event is NoticeLoad) {
      yield* _mapNoticesLoadToState();
    }
  }

  Stream<NoticeState> _mapNoticesLoadToState() async* {
    if (!state.isLoading && !state.stateHasReachedMax) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc
            .get('/api/notice?page=${state.pageIndex + 1}');
        if (response != null) {
          final contents = response['content'] as List;
          final pageIndex = response['pageable']['pageNumber'];
          final last = response['last'];
          final List<Notice> notices = contents.map((data) {
            return Notice.fromJson(data);
          }).toList();
          yield state.loaedSuccess(
            notices: state.notices != null ? state.notices + notices : notices,
            pageIndex: pageIndex + 1,
            hasReachedMax: last,
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield NoticeState.failure();
      }
    }
  }
}
