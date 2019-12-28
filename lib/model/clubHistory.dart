import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';

part 'clubHistory.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class ClubHistory extends Equatable {
  final int id;

  final int clubId;
  final String title;
  final int sortPosition;

  const ClubHistory({
    this.id,
    this.clubId,
    this.title,
    this.sortPosition,
  });

  factory ClubHistory.fromJson(Map<String, dynamic> json) =>
      _$ClubHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ClubHistoryToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ClubHistory { id: $id }';
}
