import 'package:meta/meta.dart';
import 'package:with_flutter/model/jobInfoHeart.dart';

@immutable
class JobInfoHeartState {
  final bool isLoaded;
  final bool isLoading;
  final List<JobInfoHeart> jobInfoHearts;
  final bool hasReachedMax;
  final int pageIndex;

  bool get stateHasReachedMax => isLoaded && hasReachedMax;

  JobInfoHeartState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.jobInfoHearts,
    @required this.hasReachedMax,
    @required this.pageIndex,
  });

  factory JobInfoHeartState.empty() {
    return JobInfoHeartState(
      isLoaded: false,
      isLoading: false,
      jobInfoHearts: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory JobInfoHeartState.failure() {
    return JobInfoHeartState(
      isLoaded: false,
      isLoading: false,
      jobInfoHearts: null,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  factory JobInfoHeartState.success(List<JobInfoHeart> jobInfoHearts) {
    return JobInfoHeartState(
      isLoaded: true,
      isLoading: false,
      jobInfoHearts: jobInfoHearts,
      hasReachedMax: false,
      pageIndex: 0,
    );
  }

  JobInfoHeartState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  JobInfoHeartState loaedSuccess({
    List<JobInfoHeart> jobInfoHearts,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      jobInfoHearts: jobInfoHearts,
      hasReachedMax: hasReachedMax,
      pageIndex: pageIndex,
    );
  }

  JobInfoHeartState copyWith({
    bool isLoaded,
    bool isLoading,
    List<JobInfoHeart> jobInfoHearts,
    bool hasReachedMax,
    int pageIndex,
  }) {
    return JobInfoHeartState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      jobInfoHearts: jobInfoHearts ?? this.jobInfoHearts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
