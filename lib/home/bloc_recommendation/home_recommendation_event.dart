import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeRecommendationEvent extends Equatable {
  const HomeRecommendationEvent();

  @override
  List<Object> get props => [];
}

class MembersTopLoad extends HomeRecommendationEvent {
  final int size;

  const MembersTopLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'MembersTopLoad { size: $size}';
}
