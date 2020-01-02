import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class JobInfoHeartEvent extends Equatable {
  const JobInfoHeartEvent();

  @override
  List<Object> get props => [];
}

class JobInfoHeartLoad extends JobInfoHeartEvent {
  @override
  String toString() => 'JobInfoHeartLoad';
}
