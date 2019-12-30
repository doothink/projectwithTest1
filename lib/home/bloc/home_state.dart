import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/member.dart';

@immutable
class HomeState {
  final bool isJobInfosLoaded;
  final bool isMembersTopLoaded;
  final bool isMembersLoaded;
  final bool isFeedsLoaded;
  final List<JobInfo> jobInfos;
  final List<Member> membersTop;
  final List<Member> members;
  final List<Feed> feeds;

  HomeState({
    @required this.isJobInfosLoaded,
    @required this.isMembersTopLoaded,
    @required this.isMembersLoaded,
    @required this.isFeedsLoaded,
    @required this.jobInfos,
    @required this.members,
    @required this.membersTop,
    @required this.feeds,
  });

  factory HomeState.empty() {
    return HomeState(
      isJobInfosLoaded: false,
      isMembersTopLoaded: false,
      isMembersLoaded: false,
      isFeedsLoaded: false,
      jobInfos: null,
      membersTop: null,
      members: null,
      feeds: null,
    );
  }

  factory HomeState.jobInfosEmpty() {
    return HomeState(
      isJobInfosLoaded: false,
      isMembersTopLoaded: false,
      isMembersLoaded: false,
      isFeedsLoaded: false,
      jobInfos: null,
      membersTop: null,
      members: null,
      feeds: null,
    );
  }

  factory HomeState.jobInfosLoading() {
    return HomeState(
      isJobInfosLoaded: false,
      isMembersTopLoaded: false,
      isMembersLoaded: false,
      isFeedsLoaded: false,
      jobInfos: null,
      membersTop: null,
      members: null,
      feeds: null,
    );
  }

  factory HomeState.jobInfosLoadFailure() {
    return HomeState(
      isJobInfosLoaded: false,
      isMembersTopLoaded: false,
      isMembersLoaded: false,
      isFeedsLoaded: false,
      jobInfos: null,
      membersTop: null,
      members: null,
      feeds: null,
    );
  }

  HomeState jobInfosLoaedSuccess({
    List<JobInfo> jobInfos,
  }) {
    return copyWith(
      isJobInfosLoaded: true,
      jobInfos: jobInfos,
    );
  }

  HomeState membersTopLoaedSuccess({List<Member> members}) {
    return copyWith(
      isMembersTopLoaded: true,
      membersTop: members,
    );
  }

  HomeState membersLoaedSuccess({List<Member> members}) {
    return copyWith(
      isMembersLoaded: true,
      members: members,
    );
  }

  HomeState feedsLoaedSuccess({List<Feed> feeds}) {
    return copyWith(
      isFeedsLoaded: true,
      feeds: feeds,
    );
  }

  HomeState copyWith({
    bool isJobInfosLoaded,
    bool isMembersTopLoaded,
    bool isMembersLoaded,
    bool isFeedsLoaded,
    List<JobInfo> jobInfos,
    List<Member> membersTop,
    List<Member> members,
    List<Feed> feeds,
  }) {
    return HomeState(
      isJobInfosLoaded: isJobInfosLoaded ?? this.isJobInfosLoaded,
      isMembersTopLoaded: isMembersTopLoaded ?? this.isMembersTopLoaded,
      isMembersLoaded: isMembersLoaded ?? this.isMembersLoaded,
      isFeedsLoaded: isFeedsLoaded ?? this.isFeedsLoaded,
      jobInfos: jobInfos ?? this.jobInfos,
      membersTop: membersTop ?? this.membersTop,
      members: members ?? this.members,
      feeds: feeds ?? this.feeds,
    );
  }
}
