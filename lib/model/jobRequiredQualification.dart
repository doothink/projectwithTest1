import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobRequiredQualification.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobRequiredQualification extends Equatable {
  final int id;

  final int jobInfoId;
  final String qualification;
  final int sortPosition;

  const JobRequiredQualification({
    this.id,
    this.jobInfoId,
    this.qualification,
    this.sortPosition,
  });

  factory JobRequiredQualification.fromJson(Map<String, dynamic> json) =>
      _$JobRequiredQualificationFromJson(json);

  Map<String, dynamic> toJson() => _$JobRequiredQualificationToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobRequiredQualification { id: $id }';
}
