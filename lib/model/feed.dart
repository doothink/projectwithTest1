import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';
import 'package:with_flutter/model/profile.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';
import 'member.dart';

part 'feed.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Feed extends Equatable {
  final int id;

  final String title;
  final String contents;
  final String hashTags;
  final int readCount;
  final int heartCount;
  final List<MediaCollection> mediaCollections;
  final Member member;
  final Profile memberProfile;
  final int createdAt;

  const Feed({
    this.id,
    this.title,
    this.contents,
    this.hashTags,
    this.readCount,
    this.heartCount,
    this.mediaCollections,
    this.member,
    this.memberProfile,
    this.createdAt,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Feed { id: $id }';
}
