import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'injuaryHistory.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class InjuaryHistory extends Equatable {
  final int id;

  final int profileId;
  final String injuredYear;
  final String content;

  const InjuaryHistory({
    this.id,
    this.profileId,
    this.injuredYear,
    this.content,
  });

  factory InjuaryHistory.fromJson(Map<String, dynamic> json) =>
      _$InjuaryHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$InjuaryHistoryToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'InjuaryHistory { id: $id }';
}
