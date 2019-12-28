// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobInfoApply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobInfoApply _$JobInfoApplyFromJson(Map<String, dynamic> json) {
  return JobInfoApply(
    id: json['id'] as int,
    memberId: json['memberId'] as int,
    jobInfoId: json['jobInfoId'] as int,
    member: json['member'] == null
        ? null
        : Member.fromJson(json['member'] as Map<String, dynamic>),
    jobInfo: json['jobInfo'] == null
        ? null
        : JobInfo.fromJson(json['jobInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobInfoApplyToJson(JobInfoApply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'jobInfoId': instance.jobInfoId,
      'member': instance.member?.toJson(),
      'jobInfo': instance.jobInfo?.toJson(),
    };
