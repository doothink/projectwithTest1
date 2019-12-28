import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfo.dart';

@immutable
class SearchResultState {
  final bool isLoaded;
  final bool isLoading;
  final List<JobInfo> jobInfos;

  SearchResultState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.jobInfos,
  });

  factory SearchResultState.empty() {
    return SearchResultState(
      isLoaded: false,
      isLoading: false,
    );
  }

  factory SearchResultState.failure() {
    return SearchResultState(
      isLoaded: false,
      isLoading: false,
    );
  }

  SearchResultState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  SearchResultState loaedSuccess({
    List<JobInfo> jobInfos,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      jobInfos: jobInfos,
    );
  }

  SearchResultState copyWith({
    bool isLoaded,
    bool isLoading,
    List<JobInfo> jobInfos,
  }) {
    return SearchResultState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      jobInfos: jobInfos ?? this.jobInfos,
    );
  }
}
