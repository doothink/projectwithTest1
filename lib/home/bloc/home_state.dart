import 'package:meta/meta.dart';
import 'package:with_flutter/model/jobInfo.dart';

@immutable
class HomeState {
  final bool isJobInfosLoaded;
  final List<JobInfo> jobInfos;

  HomeState({
    @required this.isJobInfosLoaded,
    @required this.jobInfos,
  });

  factory HomeState.empty() {
    return HomeState(
      isJobInfosLoaded: false,
      jobInfos: null,
    );
  }

  factory HomeState.jobInfosEmpty() {
    return HomeState(
      isJobInfosLoaded: false,
      jobInfos: null,
    );
  }

  factory HomeState.jobInfosLoading() {
    return HomeState(
      isJobInfosLoaded: false,
      jobInfos: null,
    );
  }

  factory HomeState.jobInfosLoadFailure() {
    return HomeState(
      isJobInfosLoaded: false,
      jobInfos: null,
    );
  }

  factory HomeState.jobInfosLoadSuccess(List<JobInfo> jobInfos) {
    return HomeState(
      isJobInfosLoaded: true,
      jobInfos: jobInfos,
    );
  }
}
