import 'package:meta/meta.dart';
import 'package:with_flutter/model/playerHistory.dart';

@immutable
class PlayerHistoryState {
  final bool isLoaded;
  final PlayerHistory playerHistory;
  final List<PlayerHistory> playerHistories;
  final bool isSaveButtonPressed;
  final bool isSubmitting;
  final bool isLoading;

  PlayerHistoryState({
    @required this.isLoaded,
    @required this.playerHistory,
    @required this.playerHistories,
    @required this.isSaveButtonPressed,
    @required this.isSubmitting,
    @required this.isLoading,
  });

  factory PlayerHistoryState.empty() {
    return PlayerHistoryState(
      isLoaded: false,
      playerHistory: null,
      playerHistories: null,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.loading() {
    return PlayerHistoryState(
      isLoaded: false,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: true,
    );
  }

  factory PlayerHistoryState.isLoaded(List<PlayerHistory> playerHistories) {
    return PlayerHistoryState(
      isLoaded: true,
      playerHistories: playerHistories,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.failure() {
    return PlayerHistoryState(
      isLoaded: false,
      playerHistory: null,
      playerHistories: null,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.success(PlayerHistory playerHistory) {
    return PlayerHistoryState(
      isLoaded: true,
      playerHistory: playerHistory,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.saveButtonPressed() {
    return PlayerHistoryState(
      isLoaded: false,
      isSaveButtonPressed: true,
      isSubmitting: false,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.isSaveLoading() {
    return PlayerHistoryState(
      isLoaded: false,
      isSaveButtonPressed: false,
      isSubmitting: true,
      isLoading: false,
    );
  }

  factory PlayerHistoryState.saveSuccess(List<PlayerHistory> playerHistories) {
    return PlayerHistoryState(
      isLoaded: true,
      playerHistories: playerHistories,
      isSaveButtonPressed: false,
      isSubmitting: false,
      isLoading: false,
    );
  }

  PlayerHistoryState saveLoading({
    bool isSubmitting,
  }) {
    return PlayerHistoryState(
      isLoaded: this.isLoaded,
      isSaveButtonPressed: this.isSaveButtonPressed,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isLoading: this.isLoading,
    );
  }

  PlayerHistoryState update({
    PlayerHistory playerHistory,
  }) {
    return copyWith(
      playerHistory: playerHistory,
      isLoaded: true,
    );
  }

  PlayerHistoryState copyWith({
    PlayerHistory playerHistory,
    bool isLoaded,
  }) {
    return PlayerHistoryState(
      playerHistory: playerHistory ?? this.playerHistory,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
