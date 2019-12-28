import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';
import 'package:with_flutter/model/profile.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';

part 'member.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Member extends Equatable {
  final int id;

  final String username;
  final String lastName;
  final String firstName;
  final String nickName;
  final String email;

  final List<MediaCollection> mediaCollections;
  final Profile memberProfile;

  const Member({
    this.id,
    this.username,
    this.lastName,
    this.firstName,
    this.nickName,
    this.email,
    this.mediaCollections,
    this.memberProfile,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Member { id: $id }';
}
