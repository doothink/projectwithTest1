import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/feed.dart';

import 'bloc.dart';

class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {
  final AuthenticationBloc _authenticationBloc;

  HomeFeedBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeFeedState get initialState => HomeFeedState.empty();

  @override
  Stream<HomeFeedState> transformEvents(
    Stream<HomeFeedEvent> events,
    Stream<HomeFeedState> Function(HomeFeedEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<HomeFeedEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeFeedState> mapEventToState(HomeFeedEvent event) async* {
    if (event is FeedsLoad) {
      yield* _mapFeedsLoadToState(event.size);
    }
  }

  Stream<HomeFeedState> _mapFeedsLoadToState(int size) async* {
    try {
      final response =
          await _authenticationBloc.get('/api/contentmain?pageSize=$size');
      final contents = response['content'] as List;
      final List<Feed> feeds = contents.map((data) {
        return Feed.fromJson(data);
      }).toList();

      yield HomeFeedState.loaedSuccess(feeds);
    } catch (error) {
      print("]-----] _mapFeedsLoadToState.error [-----[ ${error}");
      yield HomeFeedState.failure();
    }
  }
}
