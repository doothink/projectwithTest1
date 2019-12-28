import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schoolHistory.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class SchoolHistory extends Equatable {
  final int id;

  final int profileId;
  final String schoolPeriod;
  final String name;
  final String position;
  final String profileType;

  const SchoolHistory({
    this.id,
    this.profileId,
    this.schoolPeriod,
    this.name,
    this.position,
    this.profileType,
  });

  factory SchoolHistory.fromJson(Map<String, dynamic> json) =>
      _$SchoolHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolHistoryToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'SchoolHistory { id: $id }';
}
