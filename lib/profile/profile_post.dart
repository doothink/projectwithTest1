import 'dart:io';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:with_flutter/common/string_util.dart';
import 'package:with_flutter/model/injuaryHistory.dart';
import 'package:with_flutter/model/playerHistory.dart';
import 'package:with_flutter/model/profile.dart';
import 'package:with_flutter/model/schoolHistory.dart';
import 'package:with_flutter/playerhistory/playerhistory.dart';
import 'package:with_flutter/profile/phone_cert.dart';
import 'package:with_flutter/profile/profile_injuaryhistory_input.dart';
import 'package:with_flutter/profile/profile_playerhistory.dart';
import 'package:with_flutter/profile/profile_radio_slider.dart';
import 'package:with_flutter/profile/profile_school_input.dart';

import 'bloc/bloc.dart';

class ProfilePost extends StatefulWidget {
  ProfilePost({
    Key key,
  }) : super(key: key);

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  ProfileBloc _profileBloc;
  Profile _profile;

  @override
  void initState() {
    super.initState();
//    _scrollController.addListener(_onScroll);
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
//    _addProfileSchoolInput();
    _profileBloc.add(ProfileLoad());
  }

  int _selectAvatar = 0;

  File _image;
  String _imageNetwork;

  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _realNameController = TextEditingController();

  TextEditingController _countryController = new TextEditingController();

//  TextEditingController _gender = new TextEditingController();
  GenderSelect _gender = new GenderSelect("성별선택", null);

  TextEditingController _birthdayController = new TextEditingController();
  var _birthdayFormatter = new MaskTextInputFormatter(
      mask: '####.##.##', filter: {"#": RegExp(r'[0-9]')});

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

  void _handlePlayerInfoPhysical(int value) {
    setState(() {
      _playerInfoPhysical = value;
    });
  }

  void _handlePlayerInfoSkill(int value) {
    setState(() {
      _playerInfoSkill = value;
    });
  }

  void _handlePlayerInfoCreative(int value) {
    setState(() {
      _playerInfoCreative = value;
    });
  }

  void _handlePlayerInfoStrategy(int value) {
    setState(() {
      _playerInfoStrategy = value;
    });
  }

  void _handlePlayerInfoTeamWork(int value) {
    setState(() {
      _playerInfoTeamWork = value;
    });
  }

  TextEditingController _playerInfoLevelController =
      new TextEditingController();
  TextEditingController _clubNameController = new TextEditingController();

  TextEditingController _countryOfLeagueController =
      new TextEditingController();
  TextEditingController _leagueNameController = new TextEditingController();
  TextEditingController _playerHeightController = new TextEditingController();
  var _playerHeightFormatter = new MaskTextInputFormatter(
      mask: '###.#', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController _playerWeightController = new TextEditingController();
  var _playerWeightFormatter = new MaskTextInputFormatter(
      mask: '###.#', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController _backNumberController = new TextEditingController();
  TextEditingController _mainKickController = new TextEditingController();

  TextEditingController _positionController = new TextEditingController();
  TextEditingController _positionRoleController = new TextEditingController();

  ArmyDivSelect _armyDiv = new ArmyDivSelect("병역구분", null);

  TextEditingController _armyReasonController = new TextEditingController();
  TextEditingController _beforeClubController = new TextEditingController();
  TextEditingController _afterClubController = new TextEditingController();
  TextEditingController _movedAtController = new TextEditingController();
  var _movedAtFormatter = new MaskTextInputFormatter(
      mask: '####.##.##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController _contractEndAtController = new TextEditingController();
  var _contractEndAtFormatter = new MaskTextInputFormatter(
      mask: '####.##.##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController _transferFeeController = new TextEditingController();
  TextEditingController _salaryController = new TextEditingController();

  int _agentNetwork;
  int _agentLanguage;
  int _agentMatching;
  int _agentNegoation;
  int _agentAftercare;

  void _handleAgentNetwork(int value) {
    _agentNetwork = value;
  }

  void _handleAgentLanguage(int value) {
    _agentLanguage = value;
  }

  void _handleAgentMatching(int value) {
    _agentMatching = value;
  }

  void _handleAgentNegoation(int value) {
    _agentNegoation = value;
  }

  void _handleAgentAftercare(int value) {
    _agentAftercare = value;
  }

  List<PlayerHistory> _playerHistoryList = [];

  List<School> _schoolList = [];
  List<int> memberSchoolDelete = [];

  void _removeProfileSchoolInput(int index) {
    int findIndex = -1;
    for (int i = 0; i < _schoolList.length; i++) {
      if (_schoolList[i].index == index) {
        findIndex = i;
      }
    }
    if (findIndex > -1) {
      setState(() {
        _schoolList.removeAt(findIndex);
      });
    }
    if (index > 0) {
      memberSchoolDelete.add(index);
    }
  }

  void _addProfileSchoolInput() {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _positionController = TextEditingController();
    int index = (_schoolList.length + 1) * -1;
    setState(() {
      _schoolList.add(
        new School(
          index,
          ProfileSchoolInput(
            key: GlobalKey<FormFieldState>(),
            index: index,
            onPressed: _removeProfileSchoolInput,
            dateController: _dateController,
            nameController: _nameController,
            positionController: _positionController,
          ),
          _dateController,
          _nameController,
          _positionController,
        ),
      );
    });
  }

  School _makeProfileSchoolInput(SchoolHistory schoolHistory) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _positionController = TextEditingController();

    return new School(
      schoolHistory.id,
      ProfileSchoolInput(
        key: GlobalKey<FormFieldState>(),
        index: schoolHistory.id,
        onPressed: _removeProfileSchoolInput,
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
  List<int> injuaryHistoryDelete = [];

  void _removeInjuaryHistoryInput(int index) {
    int findIndex = -1;
    for (int i = 0; i < _injuaryHistoryList.length; i++) {
      if (_injuaryHistoryList[i].index == index) {
        findIndex = i;
      }
    }
    if (findIndex > -1) {
      setState(() {
        _injuaryHistoryList.removeAt(findIndex);
      });
    }
    if (index > 0) {
      injuaryHistoryDelete.add(index);
    }
  }

  void _addInjuaryHistoryInput() {
    TextEditingController _yaerController = TextEditingController();
    TextEditingController _contentController = TextEditingController();
    int index = (_injuaryHistoryList.length + 1) * -1;
    setState(() {
      _injuaryHistoryList.add(
        new Injuary(
          index,
          InjuaryHistoryInput(
            key: GlobalKey<FormFieldState>(),
            index: index,
            onPressed: _removeInjuaryHistoryInput,
            yearController: _yaerController,
            contentController: _contentController,
          ),
          _yaerController,
          _contentController,
        ),
      );
    });
  }

  Injuary _makeInjuaryHistoryInput(InjuaryHistory injuaryHistory) {
    TextEditingController _yaerController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    return new Injuary(
      injuaryHistory.id,
      InjuaryHistoryInput(
        key: GlobalKey<FormFieldState>(),
        index: injuaryHistory.id,
        onPressed: _removeInjuaryHistoryInput,
        yearController: _yaerController,
        contentController: _contentController,
        injuaryHistory: injuaryHistory,
      ),
      _yaerController,
      _contentController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.isLoaded) {
//          print(
//              "]-----] isLoaded [-----[ ${state.profile.mediaCollections[0]}");
          setState(() {
            if (state.profile.mediaCollections != null) {
              if (state.profile.mediaCollections[0] != null) {
                _imageNetwork = state.profile.mediaCollections[0].fullPathS3;
              }
            }
            _nickNameController.text =
                StringUtils.defaultNull(state.profile.nickName);
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
            _transferFeeController.text = state.profile.transferFee;
            _salaryController.text = state.profile.salary;

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
          _profileBloc.add(ProfileInit());
        }
        if (state.isPhoneCerted) {
//          print("]-----] isPhoneCerted [-----[");
        }
        if (state.isSaveBottonPressed) {
          print("]-----] isSaveBottonPressed [-----[ ${_gender.value}");
          _handleSubmit(state.isView);
        }
        if (state.isLoaaing) {
          _loadingDialog(context);
        }
        if (state.isSaveSuccess) {
          print("]-----] isSaveSuccess [-----[");
//          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(bottom: 60),
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Stack(children: [
                            CircleAvatar(
                              radius: 42.5,
                              child: ClipOval(
                                child: _image != null
                                    ? Image.file(
                                        _image,
                                        width: 85.0,
                                        height: 85.0,
                                        fit: BoxFit.cover,
                                      )
                                    : _imageNetwork != null
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
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16.0,
                                child: GestureDetector(
                                  onTap: _getImage,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/icons/camera@3x.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: EdgeInsets.only(left: 17.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  enabled: false,
                                  controller: _nickNameController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
                                    hintText: '닉네임',
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                      color: const Color.fromRGBO(
                                          222, 222, 222, 1),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  controller: _realNameController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
                                    hintText: '이름',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: const Color.fromRGBO(
                                          222, 222, 222, 1),
                                    ),
                                  ),
                                ),
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "국가",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
//                                  autofocus: true,
                                  controller: _countryController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "성별",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                    return InputDecorator(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(bottom: -10),
//                                        enabledBorder: UnderlineInputBorder(
//                                            borderSide: BorderSide(
//                                                color: Colors.white)),
//                                        focusedBorder: UnderlineInputBorder(
//                                          borderSide:
//                                              BorderSide(color: Colors.white),
//                                        ),
//                                        errorBorder: UnderlineInputBorder(
//                                          borderSide:
//                                              BorderSide(color: Colors.white),
//                                        ),
                                        errorText: state.hasError
                                            ? state.errorText
                                            : null,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<GenderSelect>(
                                          value: null,
                                          iconSize: 0,
                                          isExpanded: true,
                                          isDense: true,
                                          hint: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                _gender.title,
                                                style: TextStyle(
                                                  color: _gender.value != null
                                                      ? Colors.black
                                                      : Color.fromRGBO(
                                                          222, 222, 222, 1),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      "NotoSansCJKkr-Medium",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Icon(
                                                FontAwesomeIcons.caretDown,
                                                color: Color.fromRGBO(
                                                    0, 166, 219, 1),
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          onChanged: (GenderSelect select) {
//                                            print(select.value);
                                            setState(() {
                                              _gender = select;
                                            });
                                          },
                                          items: _selectGender
                                              .map((GenderSelect item) {
                                            return DropdownMenuItem<
                                                GenderSelect>(
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
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "생년월일",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
                                  inputFormatters: [_birthdayFormatter],
                                  controller: _birthdayController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "이메일",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Stack(children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: -10),
                                      hintText: 'email@projectwith.io',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: const Color.fromRGBO(
                                            222, 222, 222, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: FlatButton(
                                      color: Color.fromRGBO(48, 190, 157, 1),
                                      textColor: Colors.white,
                                      onPressed: () {},
                                      child: Text("요청하기"),
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: PhoneCert(
                              phoneNumberController: _phoneNumberController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "좋아하는 브랜드",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
                                  controller: _favoriteBrandController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "평소에 즐겨하는 운동",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
                                  controller: _favoriteSportController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "좋아하는 축구 구단",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
                                  controller: _favoriteClubController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "좋아하는 축구 선수",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Bold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextFormField(
                                  controller: _favoritePlayerController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: -10),
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "선수 정보 입력",
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 166, 219, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Bold",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                          ),
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
                          Container(
                            margin: EdgeInsets.only(top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "피지컬",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.5),
                                  child: ProfileRadioSlider(
                                    count: 5,
                                    activeColor: Color.fromRGBO(0, 166, 219, 1),
                                    handleChange: _handlePlayerInfoPhysical,
                                    value: _playerInfoPhysical,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "기술",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.5),
                                  child: ProfileRadioSlider(
                                    count: 5,
                                    activeColor: Color.fromRGBO(0, 166, 219, 1),
                                    handleChange: _handlePlayerInfoSkill,
                                    value: _playerInfoSkill != null
                                        ? _playerInfoSkill
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "창의성",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.5),
                                  child: ProfileRadioSlider(
                                    count: 5,
                                    activeColor: Color.fromRGBO(0, 166, 219, 1),
                                    handleChange: _handlePlayerInfoCreative,
                                    value: _playerInfoCreative != null
                                        ? _playerInfoCreative
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "전략",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.5),
                                  child: ProfileRadioSlider(
                                    count: 5,
                                    activeColor: Color.fromRGBO(0, 166, 219, 1),
                                    handleChange: _handlePlayerInfoStrategy,
                                    value: _playerInfoStrategy != null
                                        ? _playerInfoStrategy
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "팀워크",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15.5),
                                  child: ProfileRadioSlider(
                                    count: 5,
                                    activeColor: Color.fromRGBO(0, 166, 219, 1),
                                    handleChange: _handlePlayerInfoTeamWork,
                                    value: _playerInfoTeamWork != null
                                        ? _playerInfoTeamWork
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "플레이어 레벨",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _playerInfoLevelController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '플레이어 레벨',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "소속된 팀명",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _clubNameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '소속된 팀명',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "리그소속 국가",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _countryOfLeagueController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '리그소속 국가',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "소속된 리그",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _leagueNameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '소속된 리그',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "키",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [_playerHeightFormatter],
                            controller: _playerHeightController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '키',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "몸무게",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
//                            inputFormatters: [_playerWeightFormatter],
                            controller: _playerWeightController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '몸무게',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "등번호",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _backNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '등번호',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "주 사용 발",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _mainKickController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '주 사용 발',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "포지션",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _positionController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: "포지션",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "포지션 역할",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _positionRoleController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: "포지션 역할",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "학력",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: _addProfileSchoolInput,
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(0, 166, 219, 1),
                                ),
                              )
                            ],
                          ),
                          _schoolList.length > 0
                              ? Column(
                                  children: _schoolList.map((item) {
                                    return item.profileSchoolInput;
                                  }).toList(),
                                )
                              : Text(""),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(bottom: -10),
//                                  enabledBorder: UnderlineInputBorder(
//                                      borderSide:
//                                          BorderSide(color: Colors.white)),
//                                  focusedBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.white),
//                                  ),
//                                  errorBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.white),
//                                  ),
                                  errorText:
                                      state.hasError ? state.errorText : null,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<ArmyDivSelect>(
                                    value: null,
                                    iconSize: 0,
                                    isExpanded: true,
                                    isDense: true,
                                    hint: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          _armyDiv.title,
                                          style: TextStyle(
                                            color: _armyDiv.value != null
                                                ? Colors.black
                                                : Color.fromRGBO(
                                                    222, 222, 222, 1),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr-Medium",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.caretDown,
                                          color: Color.fromRGBO(0, 166, 219, 1),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    onChanged: (ArmyDivSelect select) {
                                      setState(() {
                                        _armyDiv = select;
                                      });
                                    },
                                    items: _selectArmyDiv
                                        .map((ArmyDivSelect item) {
                                      return DropdownMenuItem<ArmyDivSelect>(
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
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "미필 or 면제 사유",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
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
                                  const EdgeInsets.only(bottom: -10),
                              hintText: "미필 or 면제 사유",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "출전 경기 히스토리",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _navigateAndData(context);
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            PlayerHistoryScreen()),
//                                  );
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(0, 166, 219, 1),
                                ),
                              )
                            ],
                          ),
                          _playerHistoryList.length > 0
                              ? Container(
                                  child: Column(
                                      children:
                                          _playerHistoryList.map((playHistory) {
                                    return ProfilePlayerHistory(
                                      playerHistory: playHistory,
                                    );
                                  }).toList()),
                                )
                              : Text(
                                  "",
                                  style: TextStyle(height: 0),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "부상 히스토리",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: _addInjuaryHistoryInput,
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(0, 166, 219, 1),
                                ),
                              )
                            ],
                          ),
                          _injuaryHistoryList.length > 0
                              ? Column(
                                  children: _injuaryHistoryList.map((item) {
                                    return item.injuaryHistoryInput;
                                  }).toList(),
                                )
                              : Text(""),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "이적 전 구단",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _beforeClubController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '나이키',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "이적 후 구단",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            controller: _afterClubController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '이적 후 구단',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "이적한 날짜",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [_movedAtFormatter],
                            controller: _movedAtController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: 'yyyy.mm.dd',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "계약 마감일",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [_contractEndAtFormatter],
                            controller: _contractEndAtController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: 'yyyy.mm.dd',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "이적료",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _transferFeeController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '이적료',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "내가 받는 연봉",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _salaryController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintText: '내가 받는 연봉',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
//                    isScrollingDown == true
//                        ? FlatButton(
//                            shape: RoundedRectangleBorder(),
//                            color: Color.fromRGBO(48, 124, 245, 1),
//                            onPressed: _handleSubmit)
//                        : Text("aaaa"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _handleSubmit(bool viewYn) {
    List<SchoolHistory> schoolHistories = [];
    if (_schoolList.length > 0) {
      for (int i = 0; i < _schoolList.length; i++) {
        schoolHistories.add(new SchoolHistory(
          id: _schoolList[i].index,
          schoolPeriod: _schoolList[i].dateController.text,
          name: _schoolList[i].nameController.text,
          position: _schoolList[i].positionController.text,
          profileType: "PLAYER",
        ));
      }
    }
    List<InjuaryHistory> injuaryHistories = [];
    if (_injuaryHistoryList.length > 0) {
      for (int i = 0; i < _injuaryHistoryList.length; i++) {
        injuaryHistories.add(new InjuaryHistory(
          id: _injuaryHistoryList[i].index,
          injuredYear: _injuaryHistoryList[i].yearController.text,
          content: _injuaryHistoryList[i].contentController.text,
        ));
      }
    }
    print("_gender ===[ ${_gender.title}");
    print("_gender ===[ ${_countryController.text}");
    Profile profile = new Profile(
      country: _countryController.text,
      gender: _gender.value,
      birthday: _birthdayController.text,
      email: _emailController.text,
      mobilePhoneNumber: _phoneNumberController.text,
      favoriteBrand: _favoriteBrandController.text,
      favoriteSport: _favoriteSportController.text,
      favoriteClub: _favoriteClubController.text,
      favoritePlayer: _favoritePlayerController.text,
      playerInfoPhysical: _playerInfoPhysical,
      playerInfoSkill: _playerInfoSkill,
      playerInfoCreative: _playerInfoCreative,
      playerInfoStrategy: _playerInfoStrategy,
      playerInfoTeamWork: _playerInfoTeamWork,
      playerInfoLevel: _playerInfoLevelController.text,
      clubName: _clubNameController.text,
      countryOfLeague: _countryOfLeagueController.text,
      leagueName: _leagueNameController.text,
      playerHeight: double.tryParse(_playerHeightController.text),
      playerWeight: double.tryParse(_playerWeightController.text),
      backNumber: _backNumberController.text,
      mainKick: _mainKickController.text,
      position: _positionController.text,
      positionRole: _positionRoleController.text,
      armyDiv: _armyDiv.value,
      armyReason: _armyReasonController.text,
      beforeClub: _beforeClubController.text,
      afterClub: _afterClubController.text,
      movedAt: _movedAtController.text,
      contractEndAt: _contractEndAtController.text,
      transferFee: _transferFeeController.text,
      salary: _salaryController.text,
      memberSchools: schoolHistories,
      injuaryHistories: injuaryHistories,
      memberSchoolDelete: memberSchoolDelete,
      injuaryHistoryDelete: injuaryHistoryDelete,
      profileImage:
          _image != null ? base64Encode(_image.readAsBytesSync()) : null,
      profileImageName: _image != null ? _image.path.split("/").last : null,
      publicView: viewYn,
    );

    _profileBloc.add(ProfileSave(
      viewYn: viewYn,
      profile: profile,
    ));
  }

  Future _getImage() async {
    print("_openCamera");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _navigateAndData(BuildContext context) async {
    final List<PlayerHistory> result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerHistoryScreen()),
    );
    setState(() {
      _playerHistoryList = result;
    });
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

  Future<void> _loadingDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("처리중"),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}

class School {
  final int index;
  final ProfileSchoolInput profileSchoolInput;
  final TextEditingController dateController;
  final TextEditingController nameController;
  final TextEditingController positionController;

  School(
    this.index,
    this.profileSchoolInput,
    this.dateController,
    this.nameController,
    this.positionController,
  );

  @override
  String toString() =>
      'School { index: $index , profileSchoolInput: ${profileSchoolInput}';
}

class Injuary {
  final int index;
  final InjuaryHistoryInput injuaryHistoryInput;
  final TextEditingController yearController;
  final TextEditingController contentController;

  Injuary(
    this.index,
    this.injuaryHistoryInput,
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
