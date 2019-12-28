// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(
    id: json['id'] as int,
    sportType: json['sportType'] as String,
    name: json['name'] as String,
    localName: json['localName'] as String,
    localInfo: json['localInfo'] as String,
    title: json['title'] as String,
    titleBold: json['titleBold'] as String,
    description: json['description'] as String,
    hashTags: json['hashTags'] as String,
    collectionUuid: json['collectionUuid'] as String,
    directorName: json['directorName'] as String,
    headCoachName: json['headCoachName'] as String,
    coachNames: json['coachNames'] as String,
    captainName: json['captainName'] as String,
    symbolImageUrl: json['symbolImageUrl'] as String,
    mediaCollections: (json['mediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobInfos: (json['jobInfos'] as List)
        ?.map((e) =>
            e == null ? null : JobInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clubHistories: (json['clubHistories'] as List)
        ?.map((e) =>
            e == null ? null : ClubHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clubMemberInfos: (json['clubMemberInfos'] as List)
        ?.map((e) => e == null
            ? null
            : ClubMemberInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subMediaCollections: (json['subMediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'sportType': instance.sportType,
      'name': instance.name,
      'localName': instance.localName,
      'localInfo': instance.localInfo,
      'title': instance.title,
      'titleBold': instance.titleBold,
      'description': instance.description,
      'hashTags': instance.hashTags,
      'collectionUuid': instance.collectionUuid,
      'directorName': instance.directorName,
      'headCoachName': instance.headCoachName,
      'coachNames': instance.coachNames,
      'captainName': instance.captainName,
      'symbolImageUrl': instance.symbolImageUrl,
      'mediaCollections':
          instance.mediaCollections?.map((e) => e?.toJson())?.toList(),
      'jobInfos': instance.jobInfos?.map((e) => e?.toJson())?.toList(),
      'clubHistories':
          instance.clubHistories?.map((e) => e?.toJson())?.toList(),
      'clubMemberInfos':
          instance.clubMemberInfos?.map((e) => e?.toJson())?.toList(),
      'subMediaCollections':
          instance.subMediaCollections?.map((e) => e?.toJson())?.toList(),
    };
