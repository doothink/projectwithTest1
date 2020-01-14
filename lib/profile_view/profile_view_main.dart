import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/common/string_util.dart';
import 'package:with_flutter/model/injuaryHistory.dart';
import 'package:with_flutter/model/playerHistory.dart';
import 'package:with_flutter/model/profile.dart';
import 'package:with_flutter/model/schoolHistory.dart';
import 'package:with_flutter/profile/profile_playerhistory.dart';
import 'package:with_flutter/profile_view/profile_injuaryhistory_view.dart';
import 'package:with_flutter/profile_view/profile_school_view.dart';
import 'package:with_flutter/profile_view/profile_view_radio_slider.dart';

import 'bloc/bloc.dart';

class ProfileViewMain extends StatefulWidget {
  final int _memberId;

  ProfileViewMain({Key key, @required int memberId})
      : assert(memberId != null),
        _memberId = memberId,
        super(key: key);

  @override
  State<ProfileViewMain> createState() => _ProfileViewMainState();
}

class _ProfileViewMainState extends State<ProfileViewMain> {
  ProfileViewBloc _profileBloc;

  int get _memberId => widget._memberId;
  Profile _profile;

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileViewBloc>(context);
    _profileBloc.add(ProfileViewLoad(memberId: _memberId));
  }

  String _imageNetwork;

//  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _realNameController = TextEditingController();
  TextEditingController _countryController = new TextEditingController();

  GenderSelect _gender = new GenderSelect("성별선택", null);

  TextEditingController _birthdayController = new TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _favoriteBrandController = new TextEditingController();
  TextEditingController _favoriteSportController = new TextEditingController();
  TextEditingController _favoriteClubController = new TextEditingController();
  TextEditingController _favoritePlayerController = new TextEditingController();

  int _playerInfoPhysical;
  int _playerInfoSkill;
  int _playerInfoCreative;
  int _playerInfoStrategy;
  int _playerInfoTeamWork;

  TextEditingController _playerInfoLevelController =
      new TextEditingController();
  TextEditingController _clubNameController = new TextEditingController();

  TextEditingController _countryOfLeagueController =
      new TextEditingController();
  TextEditingController _leagueNameController = new TextEditingController();
  TextEditingController _playerHeightController = new TextEditingController();

  TextEditingController _playerWeightController = new TextEditingController();
  TextEditingController _backNumberController = new TextEditingController();
  TextEditingController _mainKickController = new TextEditingController();

  TextEditingController _positionController = new TextEditingController();
  TextEditingController _positionRoleController = new TextEditingController();

  ArmyDivSelect _armyDiv = new ArmyDivSelect("병역구분", null);

  TextEditingController _armyReasonController = new TextEditingController();
  TextEditingController _beforeClubController = new TextEditingController();
  TextEditingController _afterClubController = new TextEditingController();
  TextEditingController _movedAtController = new TextEditingController();
  TextEditingController _contractEndAtController = new TextEditingController();

  TextEditingController _transferFeeController = new TextEditingController();
  TextEditingController _salaryController = new TextEditingController();

  int _agentNetwork;
  int _agentLanguage;
  int _agentMatching;
  int _agentNegoation;
  int _agentAftercare;

  List<PlayerHistory> _playerHistoryList = [];

  List<School> _schoolList = [];

  School _makeProfileSchoolInput(SchoolHistory schoolHistory) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _positionController = TextEditingController();

    return new School(
      schoolHistory.id,
      ProfileSchoolView(
        key: GlobalKey<FormFieldState>(),
        index: schoolHistory.id,
        dateController: _dateController,
        nameController: _nameController,
        positionController: _positionController,
        schoolHistory: schoolHistory,
      ),
      _dateController,
      _nameController,
      _positionController,
    );
  }

  List<Injuary> _injuaryHistoryList = [];

  Injuary _makeInjuaryHistoryInput(InjuaryHistory injuaryHistory) {
    TextEditingController _yaerController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    return new Injuary(
      injuaryHistory.id,
      InjuaryHistoryView(
        key: GlobalKey<FormFieldState>(),
        index: injuaryHistory.id,
        yearController: _yaerController,
        contentController: _contentController,
        injuaryHistory: injuaryHistory,
      ),
      _yaerController,
      _contentController,
    );
  }

  bool _isFollow = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileViewBloc, ProfileViewState>(
      listener: (context, state) {
        if (state.isLoaded) {
//          print("------------- ${state.profile.nickName}");

          setState(() {
            _isFollow = state.profile.isFollow;
            _profile = state.profile;
            if (state.profile.mediaCollections != null) {
              if (state.profile.mediaCollections[0] != null) {
                _imageNetwork = state.profile.mediaCollections[0].fullPathS3;
              }
            }
//            _nickNameController.text =
//                StringUtils.defaultNull(state.profile.nickName);
            _realNameController.text =
                StringUtils.defaultNull(state.profile.realName);
            _countryController.text = state.profile.country;
            if (state.profile.gender != null) {
              _gender = _findGenger(state.profile.gender);
            }
            _birthdayController.text = state.profile.birthday;
            _emailController.text = state.profile.email;
            _phoneNumberController.text = state.profile.mobilePhoneNumber;
            _favoriteBrandController.text = state.profile.favoriteBrand;
            _favoriteSportController.text = state.profile.favoriteSport;

            _favoriteClubController.text = state.profile.favoriteClub;
            _favoritePlayerController.text = state.profile.favoritePlayer;

            _playerInfoPhysical = state.profile.playerInfoPhysical;
            _playerInfoSkill = state.profile.playerInfoSkill;
            _playerInfoCreative = state.profile.playerInfoCreative;
            _playerInfoStrategy = state.profile.playerInfoStrategy;
            _playerInfoTeamWork = state.profile.playerInfoTeamWork;

            _playerInfoLevelController.text = state.profile.playerInfoLevel;
            _clubNameController.text = state.profile.clubName;
            _countryOfLeagueController.text = state.profile.countryOfLeague;
            _leagueNameController.text = state.profile.leagueName;
            _playerHeightController.text = state.profile.playerHeight != null
                ? state.profile.playerHeight.toString()
                : "";
            _playerWeightController.text = state.profile.playerWeight != null
                ? state.profile.playerWeight.toString()
                : "";

            _backNumberController.text = state.profile.backNumber;
            _mainKickController.text = state.profile.mainKick;
            _positionController.text = state.profile.position;
            _positionRoleController.text = state.profile.positionRole;

            if (state.profile.armyDiv != null) {
              _armyDiv = _findArmyDiv(state.profile.armyDiv);
            }

            _armyReasonController.text = state.profile.armyReason;
            _beforeClubController.text = state.profile.beforeClub;
            _afterClubController.text = state.profile.afterClub;
            _movedAtController.text = state.profile.movedAt;
            _contractEndAtController.text = state.profile.contractEndAt;
            _transferFeeController.text = state.profile.transferFee.toString();
            _salaryController.text = state.profile.salary.toString();

            if (state.profile.memberSchools != null) {
              if (state.profile.memberSchools.length > 0) {
                List<School> _schoolsTmp = [];
                for (int i = 0; i < state.profile.memberSchools.length; i++) {
                  _schoolsTmp.add(
                      _makeProfileSchoolInput(state.profile.memberSchools[i]));
                }

                _schoolList = _schoolsTmp;
              }
            }

            if (state.profile.injuaryHistories != null) {
              if (state.profile.injuaryHistories.length > 0) {
                List<Injuary> _injuaryTmp = [];
                for (int i = 0;
                    i < state.profile.injuaryHistories.length;
                    i++) {
                  _injuaryTmp.add(_makeInjuaryHistoryInput(
                      state.profile.injuaryHistories[i]));
                }

                _injuaryHistoryList = _injuaryTmp;
              }
            }
            if (state.profile.memberPlayerHistories != null) {
              if (state.profile.memberPlayerHistories.length > 0) {
                _playerHistoryList = state.profile.memberPlayerHistories;
              }
            }
          });
        }
      },
      child: BlocBuilder<ProfileViewBloc, ProfileViewState>(
        builder: (context, state) {
          return _profile != null
              ? Container(
                  child: SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 19),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 45.0,
                                  backgroundColor:
                                      Color.fromRGBO(226, 226, 226, 1),
                                  child: ClipOval(
                                    child: _imageNetwork != null
                                        ? CachedNetworkImage(
                                            width: 85.0,
                                            height: 85.0,
                                            imageUrl: _imageNetwork,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                new CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    new Icon(Icons.error),
                                          )
                                        : Image.asset(
                                            'assets/images/nophoto@3x.png',
                                            width: 85.0,
                                            height: 85.0,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Container(
//                                  margin: EdgeInsets.only(left: 17.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      state.profile.nickName != null
                                          ? Text(
                                              "${state.profile.nickName}",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0,
                                              ),
                                            )
                                          : EmptyWidget(),
                                      state.profile.realName != null
                                          ? Text(
                                              "${state.profile.realName}",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Medium",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0,
                                              ),
                                            )
                                          : EmptyWidget(),
                                      /*Container(
                                        
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_isFollow == true) {
//                                              _jobInfoBloc.add(
//                                                  JobInfoHeartDelete(
//                                                      jobInfoId: _jobInfo.id));
                                            } else {
//                                              _jobInfoBloc.add(JobInfoHeartSave(
//                                                  jobInfoId: _jobInfo.id));
                                            }
                                          },
                                          child: _isFollow != null &&
                                                  _isFollow == true
                                              ? Container(
                                                  width: 65,
                                                  padding: EdgeInsets.only(
                                                      top: 4,
                                                      bottom: 4,
                                                      right: 12,
                                                      left: 10),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          240, 94, 139, 1),
                                                      borderRadius: BorderRadius
                                                          .all(const Radius
                                                              .circular(40.0))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "팔로잉",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              "NotoSansCJKkr-Regular",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  margin:
                                                      EdgeInsets.only(top: 8),
                                                  width: 100,
                                                  padding: EdgeInsets.only(
                                                      top: 7,
                                                      bottom: 7,
                                                      left: 4,
                                                      right: 4),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color.fromRGBO(
                                                          48, 124, 245, 1),
                                                      width: 1.0,
                                                    ),
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius
                                                        .all(const Radius
                                                            .circular(40.0)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/icons/follow-nonactive.png'),
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5.0),
                                                        child: Text(
                                                          "팔로우하기",
                                                          style: TextStyle(
//                                                      height: 1,
                                                            color:
                                                                Color.fromRGBO(
                                                                    48,
                                                                    124,
                                                                    245,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr-Medium",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 11.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 26.5),
                            child: Column(
                              children: <Widget>[
                                _countryController.text != null
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "국가",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _countryController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '국가입력',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _gender.value != null
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "성별",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            FormField<String>(
                                              enabled: false,
                                              builder: (FormFieldState<String>
                                                  state) {
                                                return InputDecorator(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            bottom: -10),
                                                    errorText: state.hasError
                                                        ? state.errorText
                                                        : null,
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton<
                                                        GenderSelect>(
                                                      value: null,
                                                      iconSize: 0,
                                                      isExpanded: true,
                                                      isDense: true,
                                                      hint: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            _gender.title,
                                                            style: TextStyle(
                                                              color: _gender
                                                                          .value !=
                                                                      null
                                                                  ? Colors.black
                                                                  : Color
                                                                      .fromRGBO(
                                                                          222,
                                                                          222,
                                                                          222,
                                                                          1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "NotoSansCJKkr-Medium",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .caretDown,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    166,
                                                                    219,
                                                                    1),
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                      items: _selectGender.map(
                                                          (GenderSelect item) {
                                                        return DropdownMenuItem<
                                                            GenderSelect>(
                                                          value: item,
                                                          child: new Text(
                                                            item.title,
                                                            style: new TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _birthdayController.text != null &&
                                        _birthdayController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "생년월일",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
//                                        inputFormatters: [_birthdayFormatter],
                                              controller: _birthdayController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: 'yyyy.mm.dd',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _favoriteBrandController.text != null &&
                                        _favoriteBrandController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "좋아하는 브랜드",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _favoriteBrandController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '나이키',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _favoriteSportController.text != null &&
                                        _favoriteSportController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "평소에 즐겨하는 운동",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _favoriteSportController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '축구',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _favoriteClubController.text != null &&
                                        _favoriteClubController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "좋아하는 축구팀",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _favoriteClubController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '울산현대',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _favoritePlayerController.text != null &&
                                        _favoritePlayerController
                                            .text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "좋아하는 축구 선수",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _favoritePlayerController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
//                                    hintText: '축구',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 25.5),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "플레이어 기본 역량",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "NotoSansCJKkr-Bold",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      _playerInfoPhysical != null &&
                                              _playerInfoPhysical > 0
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "피지컬",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Bold",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.0),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15.5),
                                                    child:
                                                        ProfileViewRadioSlider(
                                                      count: 5,
                                                      activeColor:
                                                          Color.fromRGBO(
                                                              0, 166, 219, 1),
                                                      value:
                                                          _playerInfoPhysical,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : EmptyWidget(),
                                      _playerInfoSkill != null &&
                                              _playerInfoSkill > 0
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "기술",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Bold",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.0),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15.5),
                                                    child:
                                                        ProfileViewRadioSlider(
                                                      count: 5,
                                                      activeColor:
                                                          Color.fromRGBO(
                                                              0, 166, 219, 1),
                                                      value: _playerInfoSkill !=
                                                              null
                                                          ? _playerInfoSkill
                                                          : 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : EmptyWidget(),
                                      _playerInfoCreative != null &&
                                              _playerInfoCreative > 0
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "창의성",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Bold",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.0),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15.5),
                                                    child:
                                                        ProfileViewRadioSlider(
                                                      count: 5,
                                                      activeColor:
                                                          Color.fromRGBO(
                                                              0, 166, 219, 1),
                                                      value: _playerInfoCreative !=
                                                              null
                                                          ? _playerInfoCreative
                                                          : 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : EmptyWidget(),
                                      _playerInfoStrategy != null &&
                                              _playerInfoStrategy > 0
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "전략",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Bold",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.0),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15.5),
                                                    child:
                                                        ProfileViewRadioSlider(
                                                      count: 5,
                                                      activeColor:
                                                          Color.fromRGBO(
                                                              0, 166, 219, 1),
                                                      value: _playerInfoStrategy !=
                                                              null
                                                          ? _playerInfoStrategy
                                                          : 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : EmptyWidget(),
                                      _playerInfoTeamWork != null &&
                                              _playerInfoTeamWork > 0
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "팀워크",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Bold",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.0),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15.5),
                                                    child:
                                                        ProfileViewRadioSlider(
                                                      count: 5,
                                                      activeColor:
                                                          Color.fromRGBO(
                                                              0, 166, 219, 1),
                                                      value: _playerInfoTeamWork !=
                                                              null
                                                          ? _playerInfoTeamWork
                                                          : 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : EmptyWidget(),
                                    ],
                                  ),
                                ),
                                _playerInfoLevelController.text != null &&
                                        _playerInfoLevelController
                                            .text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "플레이어 레벨",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _playerInfoLevelController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '플레이어 레벨',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _clubNameController.text != null &&
                                        _clubNameController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "소속된 팀명",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _clubNameController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '소속된 팀명',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _countryOfLeagueController.text != null &&
                                        _countryOfLeagueController
                                            .text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "리그소속 국가",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _countryOfLeagueController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '리그소속 국가',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _leagueNameController.text != null &&
                                        _leagueNameController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "소속된 리그",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _leagueNameController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '소속된 리그',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _playerHeightController.text != null &&
                                        _playerHeightController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "키",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _playerHeightController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '키',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _playerWeightController.text != null &&
                                        _playerWeightController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "몸무게",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _playerWeightController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '몸무게',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _backNumberController.text != null &&
                                        _backNumberController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "등번호",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _backNumberController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '등번호',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _backNumberController.text != null &&
                                        _backNumberController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "주 사용 발",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _mainKickController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '주 사용 발',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _positionController.text != null &&
                                        _positionController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "포지션",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _positionController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: "포지션",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _positionRoleController.text != null &&
                                        _positionRoleController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "포지션 역할",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _positionRoleController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: "포지션 역할",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _schoolList != null && _schoolList.length > 0
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "학력",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        "NotoSansCJKkr-Bold",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: _schoolList.map((item) {
                                                return item.profileSchoolView;
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "병역구분",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      FormField<String>(
                                        builder:
                                            (FormFieldState<String> state) {
                                          return InputDecorator(
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      bottom: -10),
//                                  enabledBorder: UnderlineInputBorder(
//                                      borderSide:
//                                          BorderSide(color: Colors.white)),
//                                  focusedBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.white),
//                                  ),
//                                  errorBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.white),
//                                  ),
                                              errorText: state.hasError
                                                  ? state.errorText
                                                  : null,
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child:
                                                  DropdownButton<ArmyDivSelect>(
                                                value: null,
                                                iconSize: 0,
                                                isExpanded: true,
                                                isDense: true,
                                                hint: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      _armyDiv.title,
                                                      style: TextStyle(
                                                        color: _armyDiv.value !=
                                                                null
                                                            ? Colors.black
                                                            : Color.fromRGBO(
                                                                222,
                                                                222,
                                                                222,
                                                                1),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Medium",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .caretDown,
                                                      color: Color.fromRGBO(
                                                          0, 166, 219, 1),
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
//
                                                items: _selectArmyDiv
                                                    .map((ArmyDivSelect item) {
                                                  return DropdownMenuItem<
                                                      ArmyDivSelect>(
                                                    value: item,
                                                    child: new Text(
                                                      item.title,
                                                      style: new TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                _armyReasonController.text != null &&
                                        _armyReasonController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "미필 or 면제 사유",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              maxLength: 200,
                                              controller: _armyReasonController,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: "미필 or 면제 사유",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _playerHistoryList != null &&
                                        _playerHistoryList.length > 0
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "출전 경기 히스토리",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        "NotoSansCJKkr-Bold",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            _playerHistoryList.length > 0
                                                ? Container(
                                                    child: Column(
                                                        children:
                                                            _playerHistoryList.map(
                                                                (playHistory) {
                                                      return ProfilePlayerHistory(
                                                        playerHistory:
                                                            playHistory,
                                                      );
                                                    }).toList()),
                                                  )
                                                : EmptyWidget(),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                               /* _injuaryHistoryList != null &&
                                        _injuaryHistoryList.length > 0
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "부상 히스토리",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        "NotoSansCJKkr-Bold",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            _injuaryHistoryList != null &&
                                                    _injuaryHistoryList.length >
                                                        0
                                                ? Column(
                                                    children:
                                                        _injuaryHistoryList
                                                            .map((item) {
                                                      return item
                                                          .injuaryHistoryView;
                                                    }).toList(),
                                                  )
                                                : Text(""),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _beforeClubController.text != null &&
                                        _beforeClubController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "이적 전 팀",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _beforeClubController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '울산현대',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _afterClubController.text != null &&
                                        _afterClubController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "이적 후 팀",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _afterClubController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '이적 후 팀',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _movedAtController.text != null &&
                                        _movedAtController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "이적한 날짜",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _movedAtController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: 'yyyy.mm.dd',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _contractEndAtController.text != null &&
                                        _contractEndAtController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "계약 마감일",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _contractEndAtController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: 'yyyy.mm.dd',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _transferFeeController.text != null &&
                                        _transferFeeController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "이적료",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller:
                                                  _transferFeeController,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '이적료',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),
                                _salaryController.text != null &&
                                        _salaryController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "내가 받는 연봉",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    "NotoSansCJKkr-Bold",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            TextFormField(
                                              enabled: false,
                                              controller: _salaryController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: -10),
                                                hintText: '내가 받는 연봉',
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: const Color.fromRGBO(
                                                      222, 222, 222, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : EmptyWidget(),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : EmptyWidget();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<ArmyDivSelect> _selectArmyDiv = [
    new ArmyDivSelect('병역필', true),
    new ArmyDivSelect('미필', false),
  ];

  ArmyDivSelect _findArmyDiv(bool armyDiv) {
    switch (armyDiv) {
      case true:
        {
          return _selectArmyDiv[0];
        }
        break;

      case false:
        {
          return _selectArmyDiv[1];
        }
        break;

      default:
        {
          return new ArmyDivSelect("병역구분", null);
        }
        break;
    }
  }

  List<GenderSelect> _selectGender = [
    new GenderSelect('남자', 'MALE'),
    new GenderSelect('여자', 'FEMALE'),
  ];

  GenderSelect _findGenger(String gender) {
//    print("_findGenger ===[ $gender");
    switch (gender) {
      case "MALE":
        {
          return _selectGender[0];
        }
        break;

      case "FEMALE":
        {
          return _selectGender[1];
        }
        break;

      default:
        {
          return new GenderSelect("성별선택", null);
        }
        break;
    }
  }
}

class School {
  final int index;
  final ProfileSchoolView profileSchoolView;
  final TextEditingController dateController;
  final TextEditingController nameController;
  final TextEditingController positionController;

  School(
    this.index,
    this.profileSchoolView,
    this.dateController,
    this.nameController,
    this.positionController,
  );

  @override
  String toString() =>
      'School { index: $index , profileSchoolView: ${profileSchoolView}';
}

class Injuary {
  final int index;
  final InjuaryHistoryView injuaryHistoryView;
  final TextEditingController yearController;
  final TextEditingController contentController;

  Injuary(
    this.index,
    this.injuaryHistoryView,
    this.yearController,
    this.contentController,
  );

  @override
  String toString() => 'InjuaryHistory { index: $index }';
}

class ArmyDivSelect {
  final String title;
  final bool value;

  ArmyDivSelect(this.title, this.value);
}

class GenderSelect {
  final String title;
  final String value;

  GenderSelect(this.title, this.value);
}
