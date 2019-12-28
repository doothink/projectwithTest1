import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/feed.dart';

import 'bloc.dart';

class FeedDetailBloc extends Bloc<FeedDetailEvent, FeedDetailState> {
  final AuthenticationBloc _authenticationBloc;

  FeedDetailBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FeedDetailState get initialState => FeedDetailState.empty();

  @override
  Stream<FeedDetailState> transformEvents(
    Stream<FeedDetailEvent> events,
    Stream<FeedDetailState> Function(FeedDetailEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<FeedDetailEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<FeedDetailState> mapEventToState(FeedDetailEvent event) async* {
    if (event is FeedDetailLoad) {
      yield* _mapFeedDetailsLoadToState(event.feedId);
    }
  }

  Stream<FeedDetailState> _mapFeedDetailsLoadToState(int feedId) async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc.get('/api/content/$feedId');
        if (response != null) {
          yield state.loaedSuccess(
            feed: Feed.fromJson(response),
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield FeedDetailState.failure();
      }
    }
  }
}
