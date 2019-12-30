import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/member.dart';

@immutable
class HomeRecommendationState {
  final bool isMembersTopLoaded;
  final List<Member> membersTop;

  HomeRecommendationState({
    @required this.isMembersTopLoaded,
    @required this.membersTop,
  });

  factory HomeRecommendationState.empty() {
    return HomeRecommendationState(
      isMembersTopLoaded: false,
      membersTop: null,
    );
  }

  factory HomeRecommendationState.loading() {
    return HomeRecommendationState(
      isMembersTopLoaded: false,
      membersTop: null,
    );
  }

  factory HomeRecommendationState.failure() {
    return HomeRecommendationState(
      isMembersTopLoaded: false,
      membersTop: null,
    );
  }

  factory HomeRecommendationState.loaedSuccess(List<Member> members) {
    return HomeRecommendationState(
      isMembersTopLoaded: true,
      membersTop: members,
    );
  }

  HomeRecommendationState copyWith({
    bool isMembersTopLoaded,
    List<Member> membersTop,
  }) {
    return HomeRecommendationState(
      isMembersTopLoaded: isMembersTopLoaded ?? this.isMembersTopLoaded,
      membersTop: membersTop ?? this.membersTop,
    );
  }
}
