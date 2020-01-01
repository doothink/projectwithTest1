// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return Notice(
    id: json['id'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    readCount: json['readCount'] as int,
    mediaCollections: (json['mediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['createdAt'] as int,
  );
}

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'readCount': instance.readCount,
      'mediaCollections':
          instance.mediaCollections?.map((e) => e?.toJson())?.toList(),
      'createdAt': instance.createdAt,
    };
