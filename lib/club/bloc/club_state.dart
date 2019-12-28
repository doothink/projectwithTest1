import 'package:meta/meta.dart';
import 'package:with_flutter/model/club.dart';

@immutable
class ClubState {
  final bool isLoaded;
  final Club club;

  ClubState({
    @required this.isLoaded,
    @required this.club,
  });

  factory ClubState.empty() {
    return ClubState(
      isLoaded: false,
      club: null,
    );
  }

  factory ClubState.loading() {
    return ClubState(
      isLoaded: false,
      club: null,
    );
  }

  factory ClubState.failure() {
    return ClubState(
      isLoaded: false,
      club: null,
    );
  }

  factory ClubState.success(Club club) {
    return ClubState(
      isLoaded: true,
      club: club,
    );
  }

  ClubState update({
    Club club,
  }) {
    return copyWith(
      club: club,
      isLoaded: true,
    );
  }

  ClubState copyWith({
    Club club,
    bool isLoaded,
  }) {
    return ClubState(
      club: club ?? this.club,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
