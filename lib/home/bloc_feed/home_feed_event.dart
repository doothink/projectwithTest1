import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeFeedEvent extends Equatable {
  const HomeFeedEvent();

  @override
  List<Object> get props => [];
}

class FeedsLoad extends HomeFeedEvent {
  final int size;

  const FeedsLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'FeedsLoad { size: $size}';
}
