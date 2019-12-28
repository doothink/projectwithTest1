// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positionType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionType _$PositionTypeFromJson(Map<String, dynamic> json) {
  return PositionType(
    id: json['id'] as int,
    sportType: json['sportType'] as String,
    positionName: json['positionName'] as String,
    sortPosition: json['sortPosition'] as int,
  );
}

Map<String, dynamic> _$PositionTypeToJson(PositionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sportType': instance.sportType,
      'positionName': instance.positionName,
      'sortPosition': instance.sortPosition,
    };
