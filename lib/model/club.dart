import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'clubHistory.dart';
import 'clubMemberInfo.dart';
import 'jobInfo.dart';
import 'mediaCollection.dart';

part 'club.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Club extends Equatable {
  final int id;

  final String sportType;
  final String name;
  final String localName;
  final String localInfo;
  final String title;
  final String titleBold;
  final String description;
  final String hashTags;
  final String collectionUuid;
  final String directorName;
  final String headCoachName;
  final String coachNames;
  final String captainName;
  final String symbolImageUrl;
  final List<MediaCollection> mediaCollections;

  final List<JobInfo> jobInfos;
  final List<ClubHistory> clubHistories;
  final List<ClubMemberInfo> clubMemberInfos;
  final List<MediaCollection> subMediaCollections;

  const Club({
    this.id,
    this.sportType,
    this.name,
    this.localName,
    this.localInfo,
    this.title,
    this.titleBold,
    this.description,
    this.hashTags,
    this.collectionUuid,
    this.directorName,
    this.headCoachName,
    this.coachNames,
    this.captainName,
    this.symbolImageUrl,
    this.mediaCollections,
    this.jobInfos,
    this.clubHistories,
    this.clubMemberInfos,
    this.subMediaCollections,
  });

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);

  Map<String, dynamic> toJson() => _$ClubToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Club { id: $id }';
}
