import 'package:equatable/equatable.dart';

abstract class MyPageEvent extends Equatable {
  const MyPageEvent();

  @override
  List<Object> get props => [];
}

class MyPageLoad extends MyPageEvent {
  @override
  String toString() => 'MyPageLoad';
}
