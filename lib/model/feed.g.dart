// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    id: json['id'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    hashTags: json['hashTags'] as String,
    readCount: json['readCount'] as int,
    heartCount: json['heartCount'] as int,
    mediaCollections: (json['mediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    member: json['member'] == null
        ? null
        : Member.fromJson(json['member'] as Map<String, dynamic>),
    memberProfile: json['memberProfile'] == null
        ? null
        : Profile.fromJson(json['memberProfile'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as int,
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'hashTags': instance.hashTags,
      'readCount': instance.readCount,
      'heartCount': instance.heartCount,
      'mediaCollections':
          instance.mediaCollections?.map((e) => e?.toJson())?.toList(),
      'member': instance.member?.toJson(),
      'memberProfile': instance.memberProfile?.toJson(),
      'createdAt': instance.createdAt,
    };
