import 'package:meta/meta.dart';
import 'package:with_flutter/model/member.dart';
import 'package:with_flutter/model/notice.dart';

@immutable
class HomeNoticeState {
  final bool isLoaded;
  final List<Notice> notices;

  HomeNoticeState({
    @required this.isLoaded,
    @required this.notices,
  });

  factory HomeNoticeState.empty() {
    return HomeNoticeState(
      isLoaded: false,
      notices: null,
    );
  }

  factory HomeNoticeState.loading() {
    return HomeNoticeState(
      isLoaded: false,
      notices: null,
    );
  }

  factory HomeNoticeState.failure() {
    return HomeNoticeState(
      isLoaded: false,
      notices: null,
    );
  }

  factory HomeNoticeState.loaedSuccess(List<Notice> notices) {
    return HomeNoticeState(
      isLoaded: true,
      notices: notices,
    );
  }

  HomeNoticeState copyWith({
    bool isLoaded,
    List<Notice> notices,
  }) {
    return HomeNoticeState(
      isLoaded: isLoaded ?? this.isLoaded,
      notices: notices ?? this.notices,
    );
  }
}
