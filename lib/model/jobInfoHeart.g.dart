// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobInfoHeart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobInfoHeart _$JobInfoHeartFromJson(Map<String, dynamic> json) {
  return JobInfoHeart(
    id: json['id'] as int,
    memberId: json['memberId'] as int,
    jobInfoId: json['jobInfoId'] as int,
    member: json['member'] == null
        ? null
        : Member.fromJson(json['member'] as Map<String, dynamic>),
    jobInfo: json['jobInfo'] == null
        ? null
        : JobInfo.fromJson(json['jobInfo'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as int,
  );
}

Map<String, dynamic> _$JobInfoHeartToJson(JobInfoHeart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'jobInfoId': instance.jobInfoId,
      'member': instance.member?.toJson(),
      'jobInfo': instance.jobInfo?.toJson(),
      'createdAt': instance.createdAt,
    };
