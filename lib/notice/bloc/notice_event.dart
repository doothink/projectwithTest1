import 'package:equatable/equatable.dart';

abstract class NoticeEvent extends Equatable {
  const NoticeEvent();

  @override
  List<Object> get props => [];
}

class NoticeLoad extends NoticeEvent {
  @override
  String toString() => 'NoticeLoad';
}
