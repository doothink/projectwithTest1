import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'positionType.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class PositionType extends Equatable {
  final int id;

  final String sportType;
  final String positionName;
  final int sortPosition;

  const PositionType({
    this.id,
    this.sportType,
    this.positionName,
    this.sortPosition,
  });

  factory PositionType.fromJson(Map<String, dynamic> json) =>
      _$PositionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PositionTypeToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'PositionType { id: $id }';
}
