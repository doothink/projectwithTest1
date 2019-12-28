// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubHistory _$ClubHistoryFromJson(Map<String, dynamic> json) {
  return ClubHistory(
    id: json['id'] as int,
    clubId: json['clubId'] as int,
    title: json['title'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$ClubHistoryToJson(ClubHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clubId': instance.clubId,
      'title': instance.title,
      'sortPosition': instance.sortPosition,
    };
