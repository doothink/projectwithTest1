import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';

@immutable
class FeedDetailState {
  final bool isLoaded;
  final bool isLoading;
  final Feed feed;

  FeedDetailState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.feed,
  });

  factory FeedDetailState.empty() {
    return FeedDetailState(
      isLoaded: false,
      isLoading: false,
      feed: null,
    );
  }

  factory FeedDetailState.failure() {
    return FeedDetailState(
      isLoaded: false,
      isLoading: false,
      feed: null,
    );
  }

  FeedDetailState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  FeedDetailState loaedSuccess({
    Feed feed,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      feed: feed,
    );
  }

  FeedDetailState copyWith({
    bool isLoaded,
    bool isLoading,
    Feed feed,
  }) {
    return FeedDetailState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      feed: feed ?? this.feed,
    );
  }
}
