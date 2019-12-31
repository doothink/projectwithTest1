import 'package:meta/meta.dart';
import 'package:with_flutter/model/jobInfo.dart';

@immutable
class JobInfoState {
  final bool isLoading;
  final bool isLoaded;
  final bool isSaved;
  final JobInfo jobInfo;
  final bool isHeart;
  final bool isHeartSuccess;
  final bool isHeartDeleteSuccess;
  final int heartCount;

  JobInfoState({
    @required this.isLoading,
    @required this.isLoaded,
    @required this.isSaved,
    @required this.jobInfo,
    @required this.isHeart,
    @required this.isHeartSuccess,
    @required this.isHeartDeleteSuccess,
    @required this.heartCount,
  });

  factory JobInfoState.empty() {
    return JobInfoState(
      isLoading: false,
      isLoaded: false,
      isSaved: false,
      jobInfo: null,
      isHeart: false,
      isHeartSuccess: false,
      isHeartDeleteSuccess: false,
      heartCount: 0,
    );
  }

  factory JobInfoState.loading() {
    return JobInfoState(
      isLoading: false,
      isLoaded: false,
      isSaved: false,
      jobInfo: null,
      isHeart: false,
      isHeartSuccess: false,
      isHeartDeleteSuccess: false,
      heartCount: 0,
    );
  }

  factory JobInfoState.failure() {
    return JobInfoState(
      isLoading: false,
      isLoaded: false,
      isSaved: true,
      jobInfo: null,
      isHeart: false,
      isHeartSuccess: false,
      isHeartDeleteSuccess: false,
      heartCount: 0,
    );
  }

  factory JobInfoState.success(JobInfo jobInfo) {
    return JobInfoState(
      isLoading: false,
      isLoaded: true,
      isSaved: false,
      jobInfo: jobInfo,
      isHeart: false,
      isHeartSuccess: false,
      isHeartDeleteSuccess: false,
      heartCount: jobInfo.heartCount,
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

  JobInfoState updateSave() {
    return copyWith(
      isSaved: true,
      isLoading: false,
    );
  }

  JobInfoState updateLoading({bool isLoading}) {
    return copyWith(
      isLoading: isLoading,
    );
  }

  JobInfoState updateHeart({
    bool isHeart,
    int heartCount,
  }) {
    return copyWith(
      isHeart: isHeart,
      isHeartSuccess: true,
      heartCount: heartCount,
    );
  }

  JobInfoState updateHeartDelete({
    bool isHeart,
    int heartCount,
  }) {
    return copyWith(
      isHeart: isHeart,
      isHeartDeleteSuccess: true,
      heartCount: heartCount,
    );
  }

  JobInfoState copyWith({
    JobInfo jobInfo,
    bool isLoaded,
    bool isSaved,
    bool isLoading,
    bool isHeart,
    bool isHeartSuccess,
    bool isHeartDeleteSuccess,
    int heartCount,
  }) {
    return JobInfoState(
      jobInfo: jobInfo ?? this.jobInfo,
      isLoaded: isLoaded ?? this.isLoaded,
      isSaved: isSaved ?? this.isSaved,
      isLoading: isLoading ?? this.isLoading,
      isHeart: isHeart ?? this.isHeart,
      isHeartSuccess: isHeartSuccess ?? this.isHeartSuccess,
      isHeartDeleteSuccess: isHeartDeleteSuccess ?? this.isHeartDeleteSuccess,
      heartCount: heartCount ?? this.heartCount,
    );
  }
}
