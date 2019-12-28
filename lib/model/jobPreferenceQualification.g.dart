// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobPreferenceQualification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPreferenceQualification _$JobPreferenceQualificationFromJson(
    Map<String, dynamic> json) {
  return JobPreferenceQualification(
    id: json['id'] as int,
    jobInfoId: json['jobInfoId'] as int,
    qualification: json['qualification'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$JobPreferenceQualificationToJson(
        JobPreferenceQualification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobInfoId': instance.jobInfoId,
      'qualification': instance.qualification,
      'sortPosition': instance.sortPosition,
    };
