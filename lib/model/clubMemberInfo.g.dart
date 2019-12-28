// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubMemberInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubMemberInfo _$ClubMemberInfoFromJson(Map<String, dynamic> json) {
  return ClubMemberInfo(
    id: json['id'] as int,
    clubId: json['clubId'] as int,
    positionType: json['positionType'] == null
        ? null
        : PositionType.fromJson(json['positionType'] as Map<String, dynamic>),
    memberCount: json['memberCount'] as int,
  );
}

Map<String, dynamic> _$ClubMemberInfoToJson(ClubMemberInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clubId': instance.clubId,
      'positionType': instance.positionType?.toJson(),
      'memberCount': instance.memberCount,
    };
