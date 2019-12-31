import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/feed.dart';

import 'bloc.dart';

class FeedRecommandBloc extends Bloc<FeedRecommandEvent, FeedRecommandState> {
  final AuthenticationBloc _authenticationBloc;

  FeedRecommandBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FeedRecommandState get initialState => FeedRecommandState.empty();

  @override
  Stream<FeedRecommandState> transformEvents(
    Stream<FeedRecommandEvent> events,
    Stream<FeedRecommandState> Function(FeedRecommandEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<FeedRecommandEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<FeedRecommandState> mapEventToState(FeedRecommandEvent event) async* {
    if (event is FeedRecommandLoad) {
      yield* _mapFeedRecommandsLoadToState(event.size);
    }
  }

  Stream<FeedRecommandState> _mapFeedRecommandsLoadToState(int size) async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        final response =
            await _authenticationBloc.get('/api/contentmain?pageSize=$size');
        if (response != null) {
          final contents = response['content'] as List;
          final List<Feed> feeds = contents.map((data) {
            return Feed.fromJson(data);
          }).toList();
          yield FeedRecommandState.success(feeds);
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield FeedRecommandState.failure();
      }
    }
  }
}
