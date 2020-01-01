import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';
import 'package:with_flutter/model/profile.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';
import 'member.dart';

part 'notice.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Notice extends Equatable {
  final int id;

  final String title;
  final String contents;
  final int readCount;
  final List<MediaCollection> mediaCollections;
  final int createdAt;

  const Notice({
    this.id,
    this.title,
    this.contents,
    this.readCount,
    this.mediaCollections,
    this.createdAt,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Notice { id: $id }';
}
