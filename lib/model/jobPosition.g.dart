// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobPosition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPosition _$JobPositionFromJson(Map<String, dynamic> json) {
  return JobPosition(
    id: json['id'] as int,
    jobInfoId: json['jobInfoId'] as int,
    positionName: json['positionName'] as String,
    positionCondition: json['positionCondition'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$JobPositionToJson(JobPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobInfoId': instance.jobInfoId,
      'positionName': instance.positionName,
      'positionCondition': instance.positionCondition,
      'sortPosition': instance.sortPosition,
    };
