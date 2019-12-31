import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:with_flutter/model/profile.dart';

abstract class ProfileViewEvent extends Equatable {
  const ProfileViewEvent();

  @override
  List<Object> get props => [];
}

class ProfileViewInit extends ProfileViewEvent {
  @override
  String toString() => 'ProfileViewInit';
}

class ProfileViewLoad extends ProfileViewEvent {
  final int memberId;

  const ProfileViewLoad({
    @required this.memberId,
  });

  @override
  List<Object> get props => [memberId];

  @override
  String toString() => 'ProfileViewLoad { memberId: $memberId}';
}
