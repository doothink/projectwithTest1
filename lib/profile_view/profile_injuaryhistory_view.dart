import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:with_flutter/model/injuaryHistory.dart';

class InjuaryHistoryView extends StatefulWidget {
  final int _index;
  final TextEditingController _yearController;
  final TextEditingController _contentController;
  final InjuaryHistory _injuaryHistory;

  InjuaryHistoryView({
    Key key,
    int index,
    @required TextEditingController yearController,
    @required TextEditingController contentController,
    InjuaryHistory injuaryHistory,
  })  : _index = index,
        assert(yearController != null),
        _yearController = yearController,
        assert(contentController != null),
        _contentController = contentController,
        _injuaryHistory = injuaryHistory,
        super(key: key);

  @override
  _InjuaryHistoryViewState createState() => _InjuaryHistoryViewState();
}

class _InjuaryHistoryViewState extends State<InjuaryHistoryView> {
  int get _index => widget._index;

  TextEditingController get _yearController => widget._yearController;
  var _yearFormatter =
      new MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});

  TextEditingController get _contentController => widget._contentController;

  InjuaryHistory get _injuaryHistory => widget._injuaryHistory;

  _delete() {
//    _onPressed(_index);
  }

  @override
  void initState() {
    super.initState();

    if (_injuaryHistory != null) {
      if (_injuaryHistory.injuredYear != null) {
        if (_injuaryHistory.injuredYear.isNotEmpty) {
          _yearController.text = _injuaryHistory.injuredYear;
        }
      }
      if (_injuaryHistory.content != null) {
        if (_injuaryHistory.content.isNotEmpty) {
          _contentController.text = _injuaryHistory.content;
        }
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
              inputFormatters: [_yearFormatter],
              controller: _yearController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
//              contentPadding: const EdgeInsets.only(bottom: -10),
                hintText: "부상년도",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(222, 222, 222, 1),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: TextField(
              enabled: false,
              controller: _contentController,
              decoration: InputDecoration(
                hintText: "부상내용",
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
    _yearController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
