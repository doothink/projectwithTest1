import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeBestEvent extends Equatable {
  const HomeBestEvent();

  @override
  List<Object> get props => [];
}

class MembersLoad extends HomeBestEvent {
  final int size;

  const MembersLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'MembersLoad { size: $size}';
}
