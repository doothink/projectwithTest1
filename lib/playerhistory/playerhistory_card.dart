import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:with_flutter/model/playerHistory.dart';

class PlayerHistoryCard extends StatefulWidget {
  final int _index;
  final Function _delete;
  final Function _setYear;
  final TextEditingController _leagueNameController;
  final TextEditingController _selectionPlayCountController;
  final TextEditingController _playCountController;
  final TextEditingController _goalCountController;
  final TextEditingController _assistCountController;
  final TextEditingController _yellowCardCountController;
  final TextEditingController _redCardCountController;
  final PlayerHistory _playerHistory;

  PlayerHistoryCard({
    Key key,
    @required int index,
    @required Function delete,
    @required Function setYear,
    @required TextEditingController leagueNameController,
    @required TextEditingController selectionPlayCountController,
    @required TextEditingController playCountController,
    @required TextEditingController goalCountController,
    @required TextEditingController assistCountController,
    @required TextEditingController yellowCardCountController,
    @required TextEditingController redCardCountController,
    PlayerHistory playerHistory,
  })  : assert(index != null),
        _index = index,
        assert(delete != null),
        _delete = delete,
        assert(setYear != null),
        _setYear = setYear,
        assert(leagueNameController != null),
        _leagueNameController = leagueNameController,
        assert(selectionPlayCountController != null),
        _selectionPlayCountController = selectionPlayCountController,
        assert(playCountController != null),
        _playCountController = playCountController,
        assert(goalCountController != null),
        _goalCountController = goalCountController,
        assert(assistCountController != null),
        _assistCountController = assistCountController,
        assert(yellowCardCountController != null),
        _yellowCardCountController = yellowCardCountController,
        assert(redCardCountController != null),
        _redCardCountController = redCardCountController,
        _playerHistory = playerHistory,
        super(key: key);

  @override
  _PlayerHistoryCardState createState() => _PlayerHistoryCardState();
}

class _PlayerHistoryCardState extends State<PlayerHistoryCard> {
  int get _index => widget._index;

  Function get _delete => widget._delete;

  Function get _setYear => widget._setYear;

  TextEditingController get _leagueNameController =>
      widget._leagueNameController;

  TextEditingController get _selectionPlayCountController =>
      widget._selectionPlayCountController;

  TextEditingController get _playCountController => widget._playCountController;

  TextEditingController get _goalCountController => widget._goalCountController;

  TextEditingController get _assistCountController =>
      widget._assistCountController;

  TextEditingController get _yellowCardCountController =>
      widget._yellowCardCountController;

  TextEditingController get _redCardCountController =>
      widget._redCardCountController;

  PlayerHistory get _playerHistory => widget._playerHistory;

  String _playYear;
  int _selectionPlayCount;

  List<String> _selectyear = [];

  @override
  void initState() {
    super.initState();
    _creatYear();
    if (_playerHistory != null) {
//      print("]-----] _playerHistory [-----[ ${_playerHistory}");
      setState(() {
        _playYear = _playerHistory.playYear;
      });

      if (_playerHistory.leagueName.isNotEmpty) {
        _leagueNameController.text = _playerHistory.leagueName;
      }

      if (_playerHistory.selectionPlayCount != null) {
        _selectionPlayCountController.text =
            _playerHistory.selectionPlayCount.toString();
      }
      if (_playerHistory.playCount != null) {
        _playCountController.text = _playerHistory.playCount.toString();
      }
      if (_playerHistory.goalCount != null) {
        _goalCountController.text = _playerHistory.goalCount.toString();
      }
      if (_playerHistory.assistCount != null) {
        _assistCountController.text = _playerHistory.assistCount.toString();
      }
      if (_playerHistory.yellowCardCount != null) {
        _yellowCardCountController.text =
            _playerHistory.yellowCardCount.toString();
      }
      if (_playerHistory.redCardCount != null) {
        _redCardCountController.text = _playerHistory.redCardCount.toString();
      }
    }
  }

  void _creatYear() {
    int startYear = DateTime.now().year.toInt();
    _selectyear.add(startYear.toString());
    for (int i = 1; i < 7; i++) {
      int setYear = startYear - i;
      if (setYear > 0) {
        _selectyear.add(setYear.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.all(0),

                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "삭제",
                      style: const TextStyle(
                          color: const Color(0xff7c7c7c),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Image.asset(
                        'assets/images/icons/213@3x.png',
                        width: 6.5,
                      ),
                    ),
                  ],
                ),
//            iconSize: 6.5,
                onPressed: () {
                  _delete(_index);
                },
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  alignment: Alignment.center,
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: null,
                            iconSize: 0,
                            isExpanded: true,
                            isDense: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _playYear != null ? _playYear : "년도",
                                  style: TextStyle(
                                    color: _playYear != null
                                        ? Colors.black
                                        : Color.fromRGBO(222, 222, 222, 1),
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
                            onChanged: (String value) {
                              _setYear(_index, value);
                              setState(() {
                                _playYear = value;
                              });
                            },
                            items: _selectyear.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: new TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    controller: _leagueNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: -10),
                      hintText: '리그명',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: const Color.fromRGBO(222, 222, 222, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "선발 출전 경기 수",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/images/icons/284@3x.png',
                              width: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              controller: _selectionPlayCountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: -10),
//                              hintText: 'email@projectwith.io',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(222, 222, 222, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: VerticalDivider(
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "출전 경기 수",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/icons/916@3x.png',
                            width: 20,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _playCountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
//                              hintText: 'email@projectwith.io',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "골",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/icons/283@3x.png',
                            width: 21.3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _goalCountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
//                              hintText: 'email@projectwith.io',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: VerticalDivider(
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "어시스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/icons/809@3x.png',
                            width: 26.7,
                            height: 22.5,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _assistCountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
//                              hintText: 'email@projectwith.io',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "옐로우카드",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/images/icons/446@3x.png',
                              width: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              controller: _yellowCardCountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: -10),
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(222, 222, 222, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: VerticalDivider(
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "레드카드",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/icons/447@3x.png',
                            width: 20,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            controller: _redCardCountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: -10),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromRGBO(222, 222, 222, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
