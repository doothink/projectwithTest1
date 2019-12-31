import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';

@immutable
class FeedRecommandState {
  final bool isLoaded;
  final bool isLoading;
  final List<Feed> feeds;

  FeedRecommandState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.feeds,
  });

  factory FeedRecommandState.empty() {
    return FeedRecommandState(
      isLoaded: false,
      isLoading: false,
      feeds: null,
    );
  }

  factory FeedRecommandState.failure() {
    return FeedRecommandState(
      isLoaded: false,
      isLoading: false,
      feeds: null,
    );
  }

  factory FeedRecommandState.success(List<Feed> feeds) {
    return FeedRecommandState(
      isLoaded: true,
      isLoading: false,
      feeds: feeds,
    );
  }

  FeedRecommandState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  FeedRecommandState loaedSuccess({
    List<Feed> feeds,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      feeds: feeds,
    );
  }

  FeedRecommandState copyWith({
    bool isLoaded,
    bool isLoading,
    List<Feed> feeds,
  }) {
    return FeedRecommandState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      feeds: feeds ?? this.feeds,
    );
  }
}
