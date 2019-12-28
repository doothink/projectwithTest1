import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobPosition.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobPosition extends Equatable {
  final int id;

  final int jobInfoId;
  final String positionName;
  final String positionCondition;
  final int sortPosition;

  const JobPosition({
    this.id,
    this.jobInfoId,
    this.positionName,
    this.positionCondition,
    this.sortPosition,
  });

  factory JobPosition.fromJson(Map<String, dynamic> json) =>
      _$JobPositionFromJson(json);

  Map<String, dynamic> toJson() => _$JobPositionToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobPosition { id: $id }';
}
