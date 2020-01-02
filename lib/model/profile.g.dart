// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'] as int,
    country: json['country'] as String,
    gender: json['gender'] as String,
    birthday: json['birthday'] as String,
    email: json['email'] as String,
    emailCertYn: json['emailCertYn'] as bool,
    mobilePhoneNumber: json['mobilePhoneNumber'] as String,
    mobilePhoneNumberCert: json['mobilePhoneNumberCert'] as bool,
    favoriteBrand: json['favoriteBrand'] as String,
    favoriteSport: json['favoriteSport'] as String,
    favoriteClub: json['favoriteClub'] as String,
    favoritePlayer: json['favoritePlayer'] as String,
    playerInfoPhysical: json['playerInfoPhysical'] as int,
    playerInfoSkill: json['playerInfoSkill'] as int,
    playerInfoCreative: json['playerInfoCreative'] as int,
    playerInfoStrategy: json['playerInfoStrategy'] as int,
    playerInfoTeamWork: json['playerInfoTeamWork'] as int,
    playerInfoLevel: json['playerInfoLevel'] as String,
    clubName: json['clubName'] as String,
    countryOfLeague: json['countryOfLeague'] as String,
    leagueName: json['leagueName'] as String,
    playerHeight: (json['playerHeight'] as num)?.toDouble(),
    playerWeight: (json['playerWeight'] as num)?.toDouble(),
    backNumber: json['backNumber'] as String,
    mainKick: json['mainKick'] as String,
    position: json['position'] as String,
    positionRole: json['positionRole'] as String,
    armyDiv: json['armyDiv'] as bool,
    armyReason: json['armyReason'] as String,
    beforeClub: json['beforeClub'] as String,
    afterClub: json['afterClub'] as String,
    movedAt: json['movedAt'] as String,
    contractEndAt: json['contractEndAt'] as String,
    transferFee: json['transferFee'] as String,
    salary: json['salary'] as String,
    agentNetwork: json['agentNetwork'] as int,
    agentLanguage: json['agentLanguage'] as int,
    agentMatching: json['agentMatching'] as int,
    agentNegoation: json['agentNegoation'] as int,
    agentAftercare: json['agentAftercare'] as int,
    coachStrategy: json['coachStrategy'] as int,
    coachTraining: json['coachTraining'] as int,
    coachLead: json['coachLead'] as int,
    coachScouting: json['coachScouting'] as int,
    coachPlayerCareer: json['coachPlayerCareer'] as int,
    publicView: json['publicView'] as bool,
    nickName: json['nickName'] as String,
    realName: json['realName'] as String,
    memberSchools: (json['memberSchools'] as List)
        ?.map((e) => e == null
            ? null
            : SchoolHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    injuaryHistories: (json['injuaryHistories'] as List)
        ?.map((e) => e == null
            ? null
            : InjuaryHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    memberSchoolDelete:
        (json['memberSchoolDelete'] as List)?.map((e) => e as int)?.toList(),
    injuaryHistoryDelete:
        (json['injuaryHistoryDelete'] as List)?.map((e) => e as int)?.toList(),
    profileImage: json['profileImage'] as String,
    profileImageName: json['profileImageName'] as String,
    memberPlayerHistories: (json['memberPlayerHistories'] as List)
        ?.map((e) => e == null
            ? null
            : PlayerHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mediaCollections: (json['mediaCollections'] as List)
        ?.map((e) => e == null
            ? null
            : MediaCollection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isReward: json['isReward'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'email': instance.email,
      'emailCertYn': instance.emailCertYn,
      'mobilePhoneNumber': instance.mobilePhoneNumber,
      'mobilePhoneNumberCert': instance.mobilePhoneNumberCert,
      'favoriteBrand': instance.favoriteBrand,
      'favoriteSport': instance.favoriteSport,
      'favoriteClub': instance.favoriteClub,
      'favoritePlayer': instance.favoritePlayer,
      'playerInfoPhysical': instance.playerInfoPhysical,
      'playerInfoSkill': instance.playerInfoSkill,
      'playerInfoCreative': instance.playerInfoCreative,
      'playerInfoStrategy': instance.playerInfoStrategy,
      'playerInfoTeamWork': instance.playerInfoTeamWork,
      'playerInfoLevel': instance.playerInfoLevel,
      'clubName': instance.clubName,
      'countryOfLeague': instance.countryOfLeague,
      'leagueName': instance.leagueName,
      'playerHeight': instance.playerHeight,
      'playerWeight': instance.playerWeight,
      'backNumber': instance.backNumber,
      'mainKick': instance.mainKick,
      'position': instance.position,
      'positionRole': instance.positionRole,
      'armyDiv': instance.armyDiv,
      'armyReason': instance.armyReason,
      'beforeClub': instance.beforeClub,
      'afterClub': instance.afterClub,
      'movedAt': instance.movedAt,
      'contractEndAt': instance.contractEndAt,
      'transferFee': instance.transferFee,
      'salary': instance.salary,
      'agentNetwork': instance.agentNetwork,
      'agentLanguage': instance.agentLanguage,
      'agentMatching': instance.agentMatching,
      'agentNegoation': instance.agentNegoation,
      'agentAftercare': instance.agentAftercare,
      'coachStrategy': instance.coachStrategy,
      'coachTraining': instance.coachTraining,
      'coachLead': instance.coachLead,
      'coachScouting': instance.coachScouting,
      'coachPlayerCareer': instance.coachPlayerCareer,
      'publicView': instance.publicView,
      'nickName': instance.nickName,
      'realName': instance.realName,
      'memberSchools':
          instance.memberSchools?.map((e) => e?.toJson())?.toList(),
      'injuaryHistories':
          instance.injuaryHistories?.map((e) => e?.toJson())?.toList(),
      'memberSchoolDelete': instance.memberSchoolDelete,
      'injuaryHistoryDelete': instance.injuaryHistoryDelete,
      'profileImage': instance.profileImage,
      'profileImageName': instance.profileImageName,
      'memberPlayerHistories':
          instance.memberPlayerHistories?.map((e) => e?.toJson())?.toList(),
      'mediaCollections':
          instance.mediaCollections?.map((e) => e?.toJson())?.toList(),
      'isReward': instance.isReward,
    };
