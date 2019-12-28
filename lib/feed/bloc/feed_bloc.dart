import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/feed.dart';

import 'bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final AuthenticationBloc _authenticationBloc;

  FeedBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  FeedState get initialState => FeedState.empty();

  @override
  Stream<FeedState> transformEvents(
    Stream<FeedEvent> events,
    Stream<FeedState> Function(FeedEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<FeedEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is FeedLoad) {
      yield* _mapFeedsLoadToState();
    }
  }

  Stream<FeedState> _mapFeedsLoadToState() async* {
    print("]-----] state.isLoading [-----[ ${state.isLoading}");
    if (!state.isLoading && !state.stateHasReachedMax) {
      yield state.updateLoading(isLoading: true);
      try {
        String search = state.search != null ? state.search : "";
        print("]-----] state.pageIndex [-----[ ${state.pageIndex}");
        final response = await _authenticationBloc.get(
            '/api/content?page=${state.pageIndex + 1}&title=$search&contents=$search&hashTags=$search');
        if (response != null) {
          final contents = response['content'] as List;
          final pageIndex = response['pageable']['pageNumber'];
          final last = response['last'];
          final List<Feed> feeds = contents.map((data) {
            return Feed.fromJson(data);
          }).toList();
          yield state.loaedSuccess(
            feeds: state.feeds != null ? state.feeds + feeds : feeds,
            pageIndex: pageIndex + 1,
            hasReachedMax: last,
            search: search,
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield FeedState.failure();
      }
    }
  }
}
