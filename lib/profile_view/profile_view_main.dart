import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/common/string_util.dart';
import 'package:with_flutter/model/profile.dart';

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

  TextEditingController _nickNameController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileViewBloc, ProfileViewState>(
      listener: (context, state) {
        if (state.isLoaded) {
          print("------------- ${state.profile.nickName}");

          setState(() {
            _profile = state.profile;
            if (state.profile.mediaCollections != null) {
              if (state.profile.mediaCollections[0] != null) {
                _imageNetwork = state.profile.mediaCollections[0].fullPathS3;
              }
            }
            _nickNameController.text = StringUtils.defaultNull(state.profile.nickName);
            _realNameController.text = StringUtils.defaultNull(state.profile.realName);
            _countryController.text = state.profile.country;
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
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Stack(children: [
                                  CircleAvatar(
                                    radius: 42.5,
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
                                ]),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  margin: EdgeInsets.only(left: 17.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      TextFormField(
                                        enabled: false,
                                        controller: _nickNameController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              bottom: -10),
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
                                          contentPadding: const EdgeInsets.only(
                                              bottom: -10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        controller: _countryController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
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
                                ),
                                Container(
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
                                              child:
                                                  DropdownButton<GenderSelect>(
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
                                                        color: _gender.value !=
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
                                                onChanged:
                                                    (GenderSelect select) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
//                                        inputFormatters: [_birthdayFormatter],
                                        controller: _birthdayController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
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
                                ),
                                Container(
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
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _favoriteBrandController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
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
                                ),
                                Container(
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
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _favoriteSportController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
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
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          contentPadding: const EdgeInsets.only(
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
                                ),
                                Container(
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
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _favoritePlayerController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
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
                                ),
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
