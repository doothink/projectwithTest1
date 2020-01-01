import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/notice.dart';

import 'bloc.dart';

class NoticeDetailBloc extends Bloc<NoticeDetailEvent, NoticeDetailState> {
  final AuthenticationBloc _authenticationBloc;

  NoticeDetailBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  NoticeDetailState get initialState => NoticeDetailState.empty();

  @override
  Stream<NoticeDetailState> transformEvents(
    Stream<NoticeDetailEvent> events,
    Stream<NoticeDetailState> Function(NoticeDetailEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<NoticeDetailEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<NoticeDetailState> mapEventToState(NoticeDetailEvent event) async* {
    if (event is NoticeDetailLoad) {
      yield* _mapNoticeDetailsLoadToState(event.noticeId);
    }
  }

  Stream<NoticeDetailState> _mapNoticeDetailsLoadToState(int noticeId) async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc.get('/api/notice/$noticeId');
        if (response != null) {
          yield state.loaedSuccess(
            notice: Notice.fromJson(response),
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield NoticeDetailState.failure();
      }
    }
  }
}
