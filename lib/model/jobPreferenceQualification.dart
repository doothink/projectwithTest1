import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobPreferenceQualification.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobPreferenceQualification extends Equatable {
  final int id;

  final int jobInfoId;
  final String qualification;
  final int sortPosition;

  const JobPreferenceQualification({
    this.id,
    this.jobInfoId,
    this.qualification,
    this.sortPosition,
  });

  factory JobPreferenceQualification.fromJson(Map<String, dynamic> json) =>
      _$JobPreferenceQualificationFromJson(json);

  Map<String, dynamic> toJson() => _$JobPreferenceQualificationToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobPreferenceQualification { id: $id }';
}
