import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobBenefit.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobBenefit extends Equatable {
  final int id;

  final int jobInfoId;
  final String benefit;
  final int sortPosition;

  const JobBenefit({
    this.id,
    this.jobInfoId,
    this.benefit,
    this.sortPosition,
  });

  factory JobBenefit.fromJson(Map<String, dynamic> json) =>
      _$JobBenefitFromJson(json);

  Map<String, dynamic> toJson() => _$JobBenefitToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobBenefit { id: $id }';
}
