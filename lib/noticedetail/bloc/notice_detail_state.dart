import 'package:meta/meta.dart';
import 'package:with_flutter/model/notice.dart';

@immutable
class NoticeDetailState {
  final bool isLoaded;
  final bool isLoading;
  final Notice notice;

  NoticeDetailState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.notice,
  });

  factory NoticeDetailState.empty() {
    return NoticeDetailState(
      isLoaded: false,
      isLoading: false,
      notice: null,
    );
  }

  factory NoticeDetailState.failure() {
    return NoticeDetailState(
      isLoaded: false,
      isLoading: false,
      notice: null,
    );
  }

  NoticeDetailState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  NoticeDetailState loaedSuccess({
    Notice notice,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      notice: notice,
    );
  }

  NoticeDetailState copyWith({
    bool isLoaded,
    bool isLoading,
    Notice notice,
  }) {
    return NoticeDetailState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      notice: notice ?? this.notice,
    );
  }
}
