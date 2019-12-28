// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    id: json['id'] as int,
    username: json['username'] as String,
    lastName: json['lastName'] as String,
    firstName: json['firstName'] as String,
    nickName: json['nickName'] as String,
    email: json['email'] as String,
    mediaCollections: (json['mediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    memberProfile: json['memberProfile'] == null
        ? null
        : Profile.fromJson(json['memberProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'nickName': instance.nickName,
      'email': instance.email,
      'mediaCollections':
          instance.mediaCollections?.map((e) => e?.toJson())?.toList(),
      'memberProfile': instance.memberProfile?.toJson(),
    };
