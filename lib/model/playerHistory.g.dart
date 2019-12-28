// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerHistory _$PlayerHistoryFromJson(Map<String, dynamic> json) {
  return PlayerHistory(
    id: json['id'] as int,
    profileId: json['profileId'] as int,
    playYear: json['playYear'] as String,
    leagueName: json['leagueName'] as String,
    selectionPlayCount: json['selectionPlayCount'] as int,
    playCount: json['playCount'] as int,
    goalCount: json['goalCount'] as int,
    assistCount: json['assistCount'] as int,
    yellowCardCount: json['yellowCardCount'] as int,
    redCardCount: json['redCardCount'] as int,
  );
}

Map<String, dynamic> _$PlayerHistoryToJson(PlayerHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileId': instance.profileId,
      'playYear': instance.playYear,
      'leagueName': instance.leagueName,
      'selectionPlayCount': instance.selectionPlayCount,
      'playCount': instance.playCount,
      'goalCount': instance.goalCount,
      'assistCount': instance.assistCount,
      'yellowCardCount': instance.yellowCardCount,
      'redCardCount': instance.redCardCount,
    };
