import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:with_flutter/model/schoolHistory.dart';

class ProfileSchoolView extends StatefulWidget {
  final int _index;
  final TextEditingController _dateController;
  final TextEditingController _nameController;
  final TextEditingController _positionController;
  final SchoolHistory _schoolHistory;

  ProfileSchoolView({
    Key key,
    int index,
    @required TextEditingController dateController,
    @required TextEditingController nameController,
    @required TextEditingController positionController,
    SchoolHistory schoolHistory,
  })  : _index = index,
        assert(dateController != null),
        _dateController = dateController,
        assert(nameController != null),
        _nameController = nameController,
        assert(positionController != null),
        _positionController = positionController,
        _schoolHistory = schoolHistory,
        super(key: key);

  @override
  _ProfileSchoolViewState createState() => _ProfileSchoolViewState();
}

class _ProfileSchoolViewState extends State<ProfileSchoolView> {
  int get _index => widget._index;

  TextEditingController get _dateController => widget._dateController;
  var _dateFormatter = new MaskTextInputFormatter(
      mask: '####.##-####.##', filter: {"#": RegExp(r'[0-9]')});

  TextEditingController get _nameController => widget._nameController;

  TextEditingController get _positionController => widget._positionController;

  SchoolHistory get _schoolHistory => widget._schoolHistory;

  _delete() {
//    _onPressed(_index);
  }

  @override
  void initState() {
    super.initState();

    if (_schoolHistory != null) {
      if (_schoolHistory.schoolPeriod.isNotEmpty) {
        _dateController.text = _schoolHistory.schoolPeriod;
      }
      if (_schoolHistory.name.isNotEmpty) {
        _nameController.text = _schoolHistory.name;
      }
      if (_schoolHistory.position.isNotEmpty) {
        _positionController.text = _schoolHistory.position;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.23,
            child: TextFormField(
              enabled: false,
              controller: _dateController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
//              contentPadding: const EdgeInsets.only(bottom: -10),
                hintText: "재학기간",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(222, 222, 222, 1),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: TextFormField(
              enabled: false,
              controller: _nameController,
              decoration: InputDecoration(
//              contentPadding: const EdgeInsets.only(bottom: -10),
                hintText: "학교명",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(222, 222, 222, 1),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            child: TextField(
              enabled: false,
              controller: _positionController,
              decoration: InputDecoration(
                hintText: "포지션",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(222, 222, 222, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
//    _dateController.dispose();
    super.dispose();
  }
}
