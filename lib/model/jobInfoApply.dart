import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/member.dart';

part 'jobInfoApply.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobInfoApply extends Equatable {
  final int id;

  final int memberId;
  final int jobInfoId;

  final Member member;
  final JobInfo jobInfo;
  final String status;

  const JobInfoApply({
    this.id,
    this.memberId,
    this.jobInfoId,
    this.member,
    this.jobInfo,
    this.status,
  });

  factory JobInfoApply.fromJson(Map<String, dynamic> json) =>
      _$JobInfoApplyFromJson(json);

  Map<String, dynamic> toJson() => _$JobInfoApplyToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobInfoApply { id: $id }';
}
