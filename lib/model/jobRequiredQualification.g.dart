// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobRequiredQualification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequiredQualification _$JobRequiredQualificationFromJson(
    Map<String, dynamic> json) {
  return JobRequiredQualification(
    id: json['id'] as int,
    jobInfoId: json['jobInfoId'] as int,
    qualification: json['qualification'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$JobRequiredQualificationToJson(
        JobRequiredQualification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobInfoId': instance.jobInfoId,
      'qualification': instance.qualification,
      'sortPosition': instance.sortPosition,
    };
