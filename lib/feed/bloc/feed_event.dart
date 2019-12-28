import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedLoad extends FeedEvent {
  @override
  String toString() => 'FeedLoad';
}
