import 'package:meta/meta.dart';
import 'package:with_flutter/model/profile.dart';

@immutable
class ProfileViewState {
  final bool isLoaded;
  final Profile profile;

  ProfileViewState({
    @required this.isLoaded,
    @required this.profile,
  });

  factory ProfileViewState.empty() {
    return ProfileViewState(
      isLoaded: false,
      profile: null,
    );
  }

  factory ProfileViewState.loading() {
    return ProfileViewState(
      isLoaded: false,
      profile: null,
    );
  }

  factory ProfileViewState.failure() {
    return ProfileViewState(
      isLoaded: false,
      profile: null,
    );
  }

  factory ProfileViewState.success(Profile profile) {
    return ProfileViewState(
      isLoaded: true,
      profile: profile,
    );
  }

  ProfileViewState copyWith({
    Profile profile,
    bool isLoaded,
  }) {
    return ProfileViewState(
      profile: profile ?? this.profile,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
