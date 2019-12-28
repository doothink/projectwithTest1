// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schoolHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolHistory _$SchoolHistoryFromJson(Map<String, dynamic> json) {
  return SchoolHistory(
    id: json['id'] as int,
    profileId: json['profileId'] as int,
    schoolPeriod: json['schoolPeriod'] as String,
    name: json['name'] as String,
    position: json['position'] as String,
    profileType: json['profileType'] as String,
  );
}

Map<String, dynamic> _$SchoolHistoryToJson(SchoolHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileId': instance.profileId,
      'schoolPeriod': instance.schoolPeriod,
      'name': instance.name,
      'position': instance.position,
      'profileType': instance.profileType,
    };
