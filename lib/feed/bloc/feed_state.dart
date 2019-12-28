import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';

@immutable
class FeedState {
  final bool isLoaded;
  final bool isLoading;
  final List<Feed> feeds;
  final bool hasReachedMax;
  final int pageIndex;
  final String search;

  bool get stateHasReachedMax => isLoaded && hasReachedMax;

  FeedState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.feeds,
    @required this.hasReachedMax,
    @required this.pageIndex,
    @required this.search,
  });

  factory FeedState.empty() {
    return FeedState(
      isLoaded: false,
      isLoading: false,
      feeds: null,
      hasReachedMax: false,
      pageIndex: 0,
      search: null,
    );
  }

  factory FeedState.failure() {
    return FeedState(
      isLoaded: false,
      isLoading: false,
      feeds: null,
      hasReachedMax: false,
      pageIndex: 0,
      search: null,
    );
  }

  FeedState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  FeedState loaedSuccess({
    List<Feed> feeds,
    bool hasReachedMax,
    int pageIndex,
    String search,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      feeds: feeds,
      hasReachedMax: hasReachedMax,
      pageIndex: pageIndex,
      search: search,
    );
  }

  FeedState copyWith({
    bool isLoaded,
    bool isLoading,
    List<Feed> feeds,
    bool hasReachedMax,
    int pageIndex,
    String search,
  }) {
    return FeedState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      feeds: feeds ?? this.feeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
      search: search ?? this.search,
    );
  }
}
