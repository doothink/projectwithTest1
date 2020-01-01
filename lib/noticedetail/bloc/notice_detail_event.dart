import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NoticeDetailEvent extends Equatable {
  const NoticeDetailEvent();

  @override
  List<Object> get props => [];
}

class NoticeDetailLoad extends NoticeDetailEvent {
  final int noticeId;

  const NoticeDetailLoad({
    @required this.noticeId,
  });

  @override
  List<Object> get props => [noticeId];

  @override
  String toString() => 'NoticeDetailLoad';
}
