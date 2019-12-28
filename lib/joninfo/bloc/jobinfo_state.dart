import 'package:meta/meta.dart';
import 'package:with_flutter/model/jobInfo.dart';

@immutable
class JobInfoState {
  final bool isLoaded;
  final JobInfo jobInfo;

  JobInfoState({
    @required this.isLoaded,
    @required this.jobInfo,
  });

  factory JobInfoState.empty() {
    return JobInfoState(
      isLoaded: false,
      jobInfo: null,
    );
  }

  factory JobInfoState.loading() {
    return JobInfoState(
      isLoaded: false,
      jobInfo: null,
    );
  }

  factory JobInfoState.failure() {
    return JobInfoState(
      isLoaded: false,
      jobInfo: null,
    );
  }

  factory JobInfoState.success(JobInfo jobInfo) {
    return JobInfoState(
      isLoaded: true,
      jobInfo: jobInfo,
    );
  }

  JobInfoState update({
    JobInfo jobInfo,
  }) {
    return copyWith(
      jobInfo: jobInfo,
      isLoaded: true,
    );
  }

  JobInfoState copyWith({
    JobInfo jobInfo,
    bool isLoaded,
  }) {
    return JobInfoState(
      jobInfo: jobInfo ?? this.jobInfo,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
