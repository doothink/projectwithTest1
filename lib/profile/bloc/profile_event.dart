import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:with_flutter/model/profile.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInit extends ProfileEvent {
  @override
  String toString() => 'ProfileInit';
}
class ProfileLoad extends ProfileEvent {
  final int profileId;

  const ProfileLoad({
    @required this.profileId,
  });

  @override
  List<Object> get props => [profileId];

  @override
  String toString() => 'ProfileLoad { profileId: $profileId}';
}

class PhoneCerted extends ProfileEvent {
  @override
  String toString() => 'PhoneCerted';
}

class ProfileSaveButtonPressed extends ProfileEvent {
  final bool viewYn;

  const ProfileSaveButtonPressed({
    @required this.viewYn,
  });

  @override
  List<Object> get props => [viewYn];

  @override
  String toString() => 'ProfileSaveButtonPressed { viewYn: $viewYn}';
}

class ProfileSave extends ProfileEvent {
  final bool viewYn;
  final Profile profile;

  const ProfileSave({
    @required this.viewYn,
    @required this.profile,
  });

  @override
  List<Object> get props => [viewYn, profile];

  @override
  String toString() => 'ProfileSave { viewYn: $viewYn}';
}

class SuccessInit extends ProfileEvent {
  @override
  String toString() => 'SuccessInit';
}