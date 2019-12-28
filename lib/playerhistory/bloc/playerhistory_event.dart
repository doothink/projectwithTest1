import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:with_flutter/model/playerHistory.dart';

abstract class PlayerHistoryEvent extends Equatable {
  const PlayerHistoryEvent();

  @override
  List<Object> get props => [];
}

class PlayerHistoryLoad extends PlayerHistoryEvent {
  final int playerHistoryId;

  const PlayerHistoryLoad({
    this.playerHistoryId,
  });

  @override
  List<Object> get props => [playerHistoryId];

  @override
  String toString() => 'PlayerHistoryLoad { playerHistoryId: $playerHistoryId}';
}

class PlayerHistorySaveButtonPressed extends PlayerHistoryEvent {
  @override
  String toString() => 'PlayerHistorySaveButtonPressed';
}

class PlayerHistorySave extends PlayerHistoryEvent {
  final List<PlayerHistory> playerHistories;

  const PlayerHistorySave({
    @required this.playerHistories,
  });

  @override
  List<Object> get props => [playerHistories];

  @override
  String toString() => 'PlayerHistorySave { playerHistories: $playerHistories}';
}
