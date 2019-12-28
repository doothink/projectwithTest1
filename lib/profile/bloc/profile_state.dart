import 'package:meta/meta.dart';
import 'package:with_flutter/model/profile.dart';

@immutable
class ProfileState {
  final bool isLoaded;
  final Profile profile;
  final bool isPhoneCerted;
  final bool isSaveBottonPressed;
  final bool isView;
  final bool isSaveSuccess;

  ProfileState({
    @required this.isLoaded,
    @required this.profile,
    @required this.isPhoneCerted,
    @required this.isSaveBottonPressed,
    @required this.isView,
    @required this.isSaveSuccess,
  });

  factory ProfileState.empty() {
    return ProfileState(
      isLoaded: false,
      profile: null,
      isPhoneCerted: false,
      isSaveBottonPressed: false,
      isView: false,
      isSaveSuccess: false,
    );
  }

  factory ProfileState.loading() {
    return ProfileState(
      isLoaded: false,
      profile: null,
      isPhoneCerted: false,
      isSaveBottonPressed: false,
      isView: false,
      isSaveSuccess: false,
    );
  }

  factory ProfileState.failure() {
    return ProfileState(
      isLoaded: false,
      profile: null,
      isPhoneCerted: false,
      isSaveBottonPressed: false,
      isView: false,
      isSaveSuccess: false,
    );
  }

  factory ProfileState.success(Profile profile) {
    return ProfileState(
      isLoaded: true,
      profile: profile,
      isPhoneCerted: false,
      isSaveBottonPressed: false,
      isView: false,
      isSaveSuccess: false,
    );
  }

  ProfileState updatePhoneCert({
    bool isPhoneCerted,
  }) {
    return copyWith(
      isPhoneCerted: isPhoneCerted,
    );
  }

  ProfileState update({
    Profile profile,
  }) {
    return copyWith(
      profile: profile,
      isLoaded: true,
      isPhoneCerted: false,
    );
  }

  ProfileState updateSaveButtonPressed({
    bool isSaveBottonPressed,
    bool isView,
  }) {
    return copyWith(
      isSaveBottonPressed: isSaveBottonPressed,
      isView: isView,
    );
  }

  ProfileState updateSaveSuccess({
    bool isSaveSuccess,
  }) {
    return copyWith(
      isSaveSuccess: isSaveSuccess,
      isSaveBottonPressed: false,
    );
  }

  ProfileState copyWith({
    Profile profile,
    bool isLoaded,
    bool isPhoneCerted,
    bool isSaveBottonPressed,
    bool isView,
    bool isSaveSuccess,
  }) {
//    print(isSaveSuccess);
    return ProfileState(
      profile: profile ?? this.profile,
      isLoaded: isLoaded ?? this.isLoaded,
      isPhoneCerted: isPhoneCerted ?? this.isLoaded,
      isSaveBottonPressed: isSaveBottonPressed ?? this.isSaveBottonPressed,
      isView: isView ?? this.isView,
      isSaveSuccess: isSaveSuccess ?? this.isSaveSuccess,
    );
  }
}
