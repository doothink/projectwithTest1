import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FeedRecommandEvent extends Equatable {
  const FeedRecommandEvent();

  @override
  List<Object> get props => [];
}

class FeedRecommandLoad extends FeedRecommandEvent {
  final int size;

  const FeedRecommandLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'FeedRecommandLoad';
}
