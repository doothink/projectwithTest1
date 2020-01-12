import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/model/injuaryHistory.dart';
import 'package:with_flutter/model/mediaCollection.dart';
import 'package:with_flutter/model/member.dart';
import 'package:with_flutter/model/playerHistory.dart';
import 'package:with_flutter/model/schoolHistory.dart';

part 'profile.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Profile extends Equatable {
  final int id;

  final String country;
  final String gender;
  final String birthday;
  final String email;
  final bool emailCertYn;
  final String mobilePhoneNumber;
  final bool mobilePhoneNumberCert;
  final String favoriteBrand;
  final String favoriteSport;
  final String favoriteClub;
  final String favoritePlayer;
  final int playerInfoPhysical;
  final int playerInfoSkill;
  final int playerInfoCreative;
  final int playerInfoStrategy;
  final int playerInfoTeamWork;
  final String playerInfoLevel;
  final String clubName;
  final String countryOfLeague;
  final String leagueName;
  final double playerHeight;
  final double playerWeight;
  final String backNumber;
  final String mainKick;
  final String position;
  final String positionRole;
  final bool armyDiv;
  final String armyReason;
  final String beforeClub;
  final String afterClub;
  final String movedAt;
  final String contractEndAt;
  final double transferFee;
  final double salary;

  final int agentNetwork;
  final int agentLanguage;
  final int agentMatching;
  final int agentNegoation;
  final int agentAftercare;

  final int coachStrategy;
  final int coachTraining;
  final int coachLead;
  final int coachScouting;
  final int coachPlayerCareer;

  final bool publicView;

  final String nickName;
  final String realName;

  final List<SchoolHistory> memberSchools;
  final List<InjuaryHistory> injuaryHistories;
  final List<int> memberSchoolDelete;
  final List<int> injuaryHistoryDelete;

  final String profileImage;
  final String profileImageName;

  final List<PlayerHistory> memberPlayerHistories;
  final List<MediaCollection> mediaCollections;
  final int isReward;

  const Profile({
    this.id,
    this.country,
    this.gender,
    this.birthday,
    this.email,
    this.emailCertYn,
    this.mobilePhoneNumber,
    this.mobilePhoneNumberCert,
    this.favoriteBrand,
    this.favoriteSport,
    this.favoriteClub,
    this.favoritePlayer,
    this.playerInfoPhysical,
    this.playerInfoSkill,
    this.playerInfoCreative,
    this.playerInfoStrategy,
    this.playerInfoTeamWork,
    this.playerInfoLevel,
    this.clubName,
    this.countryOfLeague,
    this.leagueName,
    this.playerHeight,
    this.playerWeight,
    this.backNumber,
    this.mainKick,
    this.position,
    this.positionRole,
    this.armyDiv,
    this.armyReason,
    this.beforeClub,
    this.afterClub,
    this.movedAt,
    this.contractEndAt,
    this.transferFee,
    this.salary,
    this.agentNetwork,
    this.agentLanguage,
    this.agentMatching,
    this.agentNegoation,
    this.agentAftercare,
    this.coachStrategy,
    this.coachTraining,
    this.coachLead,
    this.coachScouting,
    this.coachPlayerCareer,
    this.publicView,
    this.nickName,
    this.realName,
    this.memberSchools,
    this.injuaryHistories,
    this.memberSchoolDelete,
    this.injuaryHistoryDelete,
    this.profileImage,
    this.profileImageName,
    this.memberPlayerHistories,
    this.mediaCollections,
    this.isReward,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Profile { id: $id }';
}
