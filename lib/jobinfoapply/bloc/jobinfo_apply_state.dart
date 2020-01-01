import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/jobInfoApply.dart';

@immutable
class JobInfoApplyState {
  final bool isLoaded;
  final bool isLoading;
  final List<JobInfoApply> jobInfoApplies;
  final bool hasReachedMax;
  final int pageIndex;

  bool get stateHasReachedMax => isLoaded && hasReachedMax;

  JobInfoApplyState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.jobInfoApplies,
    @required this.hasReachedMax,
    @required this.pageIndex,
  });

  factory JobInfoApplyState.empty() {
    return JobInfoApplyState(
      isLoaded: false,
      isLoading: false,
      jobInfoApplies: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory JobInfoApplyState.failure() {
    return JobInfoApplyState(
      isLoaded: false,
      isLoading: false,
      jobInfoApplies: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory JobInfoApplyState.success(List<JobInfoApply> jobInfoApplies) {
    return JobInfoApplyState(
      isLoaded: true,
      isLoading: false,
      jobInfoApplies: jobInfoApplies,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  JobInfoApplyState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  JobInfoApplyState loaedSuccess({
    List<JobInfoApply> jobInfoApplies,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      jobInfoApplies: jobInfoApplies,
      hasReachedMax: hasReachedMax,
      pageIndex: pageIndex,
    );
  }

  JobInfoApplyState copyWith({
    bool isLoaded,
    bool isLoading,
    List<JobInfoApply> jobInfoApplies,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return JobInfoApplyState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      jobInfoApplies: jobInfoApplies ?? this.jobInfoApplies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
