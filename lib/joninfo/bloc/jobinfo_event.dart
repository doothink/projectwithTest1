import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class JobInfoEvent extends Equatable {
  const JobInfoEvent();

  @override
  List<Object> get props => [];
}

class JobInfoLoad extends JobInfoEvent {
  final int jobInfoId;

  const JobInfoLoad({
    @required this.jobInfoId,
  });

  @override
  List<Object> get props => [jobInfoId];

  @override
  String toString() => 'JobInfoLoad { jobInfoId: $jobInfoId}';
}

class JobInfoSave extends JobInfoEvent {
  final int jobInfoId;

  const JobInfoSave({
    @required this.jobInfoId,
  });

  @override
  List<Object> get props => [jobInfoId];

  @override
  String toString() => 'JobInfoSave { jobInfoId: $jobInfoId}';
}

class JobInfoHeartSave extends JobInfoEvent {
  final int jobInfoId;

  const JobInfoHeartSave({
    @required this.jobInfoId,
  });

  @override
  List<Object> get props => [jobInfoId];

  @override
  String toString() => 'JobInfoHeartSave { jobInfoId: $jobInfoId}';
}

class JobInfoHeartDelete extends JobInfoEvent {
  final int jobInfoId;

  const JobInfoHeartDelete({
    @required this.jobInfoId,
  });

  @override
  List<Object> get props => [jobInfoId];

  @override
  String toString() => 'JobInfoHeartDelete { jobInfoId: $jobInfoId}';
}
