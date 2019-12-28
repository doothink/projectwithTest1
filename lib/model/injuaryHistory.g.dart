// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injuaryHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InjuaryHistory _$InjuaryHistoryFromJson(Map<String, dynamic> json) {
  return InjuaryHistory(
    id: json['id'] as int,
    profileId: json['profileId'] as int,
    injuredYear: json['injuredYear'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$InjuaryHistoryToJson(InjuaryHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileId': instance.profileId,
      'injuredYear': instance.injuredYear,
      'content': instance.content,
    };
