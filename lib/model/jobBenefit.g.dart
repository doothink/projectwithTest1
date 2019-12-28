// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobBenefit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobBenefit _$JobBenefitFromJson(Map<String, dynamic> json) {
  return JobBenefit(
    id: json['id'] as int,
    jobInfoId: json['jobInfoId'] as int,
    benefit: json['benefit'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$JobBenefitToJson(JobBenefit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobInfoId': instance.jobInfoId,
      'benefit': instance.benefit,
      'sortPosition': instance.sortPosition,
    };
