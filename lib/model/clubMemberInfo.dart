import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';
import 'package:with_flutter/model/positionType.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';

part 'clubMemberInfo.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class ClubMemberInfo extends Equatable {
  final int id;

  final int clubId;
  final PositionType positionType;
  final int memberCount;

  const ClubMemberInfo({
    this.id,
    this.clubId,
    this.positionType,
    this.memberCount,
  });

  factory ClubMemberInfo.fromJson(Map<String, dynamic> json) =>
      _$ClubMemberInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubMemberInfoToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ClubMemberInfo { id: $id }';
}
