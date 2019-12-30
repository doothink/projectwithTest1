import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/member.dart';

@immutable
class HomeFeedState {
  final bool isLoaded;
  final List<Feed> feeds;

  HomeFeedState({
    @required this.isLoaded,
    @required this.feeds,
  });

  factory HomeFeedState.empty() {
    return HomeFeedState(
      isLoaded: false,
      feeds: null,
    );
  }

  factory HomeFeedState.loading() {
    return HomeFeedState(
      isLoaded: false,
      feeds: null,
    );
  }

  factory HomeFeedState.failure() {
    return HomeFeedState(
      isLoaded: false,
      feeds: null,
    );
  }

  factory HomeFeedState.loaedSuccess(List<Feed> feeds) {
    return HomeFeedState(
      isLoaded: true,
      feeds: feeds,
    );
  }

  HomeFeedState copyWith({
    bool isLoaded,
    List<Member> feeds,
  }) {
    return HomeFeedState(
      isLoaded: isLoaded ?? this.isLoaded,
      feeds: feeds ?? this.feeds,
    );
  }
}
