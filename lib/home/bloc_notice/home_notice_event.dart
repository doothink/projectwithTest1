import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeNoticeEvent extends Equatable {
  const HomeNoticeEvent();

  @override
  List<Object> get props => [];
}

class NoticesLoad extends HomeNoticeEvent {
  final int size;

  const NoticesLoad({
    @required this.size,
  });

  @override
  List<Object> get props => [size];

  @override
  String toString() => 'NoticesLoad { size: $size}';
}
