import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class JobInfosLoad extends HomeEvent {
  final int size;

  const JobInfosLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'JobInfosLoad { size: $size}';
}

class JobInfosEmpty extends HomeEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'JobInfosEmpty';
}
