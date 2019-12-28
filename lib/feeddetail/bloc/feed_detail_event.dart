import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FeedDetailEvent extends Equatable {
  const FeedDetailEvent();

  @override
  List<Object> get props => [];
}

class FeedDetailLoad extends FeedDetailEvent {
  final int feedId;

  const FeedDetailLoad({
    @required this.feedId,
  });

  @override
  List<Object> get props => [feedId];

  @override
  String toString() => 'FeedDetailLoad';
}
