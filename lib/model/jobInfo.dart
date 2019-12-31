import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'club.dart';
import 'jobBenefit.dart';
import 'jobPosition.dart';
import 'jobPreferenceQualification.dart';
import 'jobRequiredQualification.dart';

part 'jobInfo.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobInfo extends Equatable {
  final int id;

  final String title;
  final String contents;
  final String hashTags;
  final int readCount;
  final int heartCount;
  final int startedAt;
  final int endedAt;
  final bool platformQualification;
  final bool profileQualification;
  final String baseSalary;
  final String etcSalary;
  final Club club;
  final List<JobBenefit> jobBenefits;
  final List<JobPreferenceQualification> jobPreferenceQualifications;
  final List<JobRequiredQualification> jobRequiredQualifications;
  final List<JobPosition> jobPositions;
  final bool isApplied;
  final bool isHearted;

  const JobInfo({
    this.id,
    this.title,
    this.contents,
    this.hashTags,
    this.readCount,
    this.heartCount,
    this.startedAt,
    this.endedAt,
    this.platformQualification,
    this.profileQualification,
    this.baseSalary,
    this.etcSalary,
    this.club,
    this.jobBenefits,
    this.jobPreferenceQualifications,
    this.jobRequiredQualifications,
    this.jobPositions,
    this.isApplied,
    this.isHearted,
  });

  factory JobInfo.fromJson(Map<String, dynamic> json) =>
      _$JobInfoFromJson(json);

  Map<String, dynamic> toJson() => _$JobInfoToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobInfo { id: $id }';
}
