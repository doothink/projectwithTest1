import 'package:meta/meta.dart';
import 'package:with_flutter/model/models.dart';

@immutable
class SearchTotalState {
  final bool isLoaded;
  final bool isLoading;
  final List<JobInfo> jobInfos;
  final List<Club> clubs;
  final List<Member> members;

  SearchTotalState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.jobInfos,
    @required this.clubs,
    @required this.members,
  });

  factory SearchTotalState.empty() {
    return SearchTotalState(
        isLoaded: false,
        isLoading: false,
        jobInfos: null,
        clubs: null,
        members: null);
  }

  factory SearchTotalState.failure() {
    return SearchTotalState(
      isLoaded: false,
      isLoading: false,
    );
  }

  SearchTotalState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  SearchTotalState loaedSuccess({
    List<JobInfo> jobInfos,
    List<Club> clubs,
    List<Member> members,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      jobInfos: jobInfos,
      clubs: clubs,
      members: members,
    );
  }

  SearchTotalState copyWith({
    bool isLoaded,
    bool isLoading,
    List<JobInfo> jobInfos,
    List<Club> clubs,
    List<Member> members,
  }) {
    return SearchTotalState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      jobInfos: jobInfos ?? this.jobInfos,
      clubs: clubs ?? this.clubs,
      members: members ?? this.members,
    );
  }
}
