import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playerHistory.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class PlayerHistory extends Equatable {
  final int id;

  final int profileId;
  final String playYear;
  final String leagueName;
  final int selectionPlayCount;
  final int playCount;
  final int goalCount;
  final int assistCount;
  final int yellowCardCount;
  final int redCardCount;

  const PlayerHistory({
    this.id,
    this.profileId,
    this.playYear,
    this.leagueName,
    this.selectionPlayCount,
    this.playCount,
    this.goalCount,
    this.assistCount,
    this.yellowCardCount,
    this.redCardCount,
  });


  factory PlayerHistory.fromJson(Map<String, dynamic> json) =>
      _$PlayerHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerHistoryToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'PlayerHistory { id: $id }';
}
