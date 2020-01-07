import 'package:meta/meta.dart';
import 'package:with_flutter/model/notice.dart';

@immutable
class NoticeState {
  final bool isLoaded;
  final bool isLoading;
  final List<Notice> notices;
  final bool hasReachedMax;
  final int pageIndex;

  bool get stateHasReachedMax => isLoaded && hasReachedMax;

  NoticeState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.notices,
    @required this.hasReachedMax,
    @required this.pageIndex,
  });

  factory NoticeState.empty() {
    return NoticeState(
      isLoaded: false,
      isLoading: false,
      notices: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory NoticeState.failure() {
    return NoticeState(
      isLoaded: false,
      isLoading: false,
      notices: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory NoticeState.success({List<Notice> notices}) {
    return NoticeState(
      isLoaded: true,
      isLoading: false,
      notices: notices,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  NoticeState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  NoticeState loaedSuccess({
    List<Notice> notices,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      notices: notices,
      hasReachedMax: hasReachedMax,
      pageIndex: pageIndex,
    );
  }

  NoticeState copyWith({
    bool isLoaded,
    bool isLoading,
    List<Notice> notices,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return NoticeState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      notices: notices ?? this.notices,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
