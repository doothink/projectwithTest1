// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobInfo _$JobInfoFromJson(Map<String, dynamic> json) {
  return JobInfo(
    id: json['id'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    hashTags: json['hashTags'] as String,
    readCount: json['readCount'] as int,
    heartCount: json['heartCount'] as int,
    startedAt: json['startedAt'] as int,
    endedAt: json['endedAt'] as int,
    platformQualification: json['platformQualification'] as bool,
    profileQualification: json['profileQualification'] as bool,
    baseSalary: json['baseSalary'] as String,
    etcSalary: json['etcSalary'] as String,
    club: json['club'] == null
        ? null
        : Club.fromJson(json['club'] as Map<String, dynamic>),
    jobBenefits: (json['jobBenefits'] as List)
        ?.map((e) =>
            e == null ? null : JobBenefit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobPreferenceQualifications: (json['jobPreferenceQualifications'] as List)
        ?.map((e) => e == null
            ? null
            : JobPreferenceQualification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobRequiredQualifications: (json['jobRequiredQualifications'] as List)
        ?.map((e) => e == null
            ? null
            : JobRequiredQualification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobPositions: (json['jobPositions'] as List)
        ?.map((e) =>
            e == null ? null : JobPosition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JobInfoToJson(JobInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'hashTags': instance.hashTags,
      'readCount': instance.readCount,
      'heartCount': instance.heartCount,
      'startedAt': instance.startedAt,
      'endedAt': instance.endedAt,
      'platformQualification': instance.platformQualification,
      'profileQualification': instance.profileQualification,
      'baseSalary': instance.baseSalary,
      'etcSalary': instance.etcSalary,
      'club': instance.club?.toJson(),
      'jobBenefits': instance.jobBenefits?.map((e) => e?.toJson())?.toList(),
      'jobPreferenceQualifications': instance.jobPreferenceQualifications
          ?.map((e) => e?.toJson())
          ?.toList(),
      'jobRequiredQualifications':
          instance.jobRequiredQualifications?.map((e) => e?.toJson())?.toList(),
      'jobPositions': instance.jobPositions?.map((e) => e?.toJson())?.toList(),
    };
