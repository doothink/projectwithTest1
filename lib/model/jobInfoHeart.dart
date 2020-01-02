import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/member.dart';

part 'jobInfoHeart.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class JobInfoHeart extends Equatable {
  final int id;

  final int memberId;
  final int jobInfoId;

  final Member member;
  final JobInfo jobInfo;
  final int createdAt;

  const JobInfoHeart({
    this.id,
    this.memberId,
    this.jobInfoId,
    this.member,
    this.jobInfo,
    this.createdAt,
  });

  factory JobInfoHeart.fromJson(Map<String, dynamic> json) =>
      _$JobInfoHeartFromJson(json);

  Map<String, dynamic> toJson() => _$JobInfoHeartToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'JobInfoHeart { id: $id }';
}
