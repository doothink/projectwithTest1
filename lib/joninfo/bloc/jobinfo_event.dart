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
