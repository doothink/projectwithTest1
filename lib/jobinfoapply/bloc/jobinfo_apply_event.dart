import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class JobInfoApplyEvent extends Equatable {
  const JobInfoApplyEvent();

  @override
  List<Object> get props => [];
}

class JobInfoApplyLoad extends JobInfoApplyEvent {
  @override
  String toString() => 'JobInfoApplyLoad';
}
