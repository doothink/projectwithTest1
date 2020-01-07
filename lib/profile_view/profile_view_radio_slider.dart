import 'package:flutter/material.dart';

class ProfileViewRadioSlider extends StatefulWidget {
  final int _count;

  final Color _activeColor;
  final int _value;

  ProfileViewRadioSlider({
    Key key,
    @required int count,
    @required Color activeColor,
    @required int value,
  })  : assert(count != null),
        _count = count,
        assert(activeColor != null),
        _activeColor = activeColor,
        _value = value,
        super(key: key);

  @override
  _ProfileViewRadioSliderState createState() => _ProfileViewRadioSliderState();
}

class _ProfileViewRadioSliderState extends State<ProfileViewRadioSlider> {
  int get _count => widget._count;

  Color get _activeColor => widget._activeColor;

  int get _value => widget._value;

  int _selectValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectValue = _value;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Divider(
//            height: 0,
            thickness: 4,
            color: Color.fromRGBO(195, 195, 195, 1),
          ),
          Container(
//            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 1),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_count, (index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(195, 195, 195, 1),
                          radius: 7,
                          child: CircleAvatar(
                            backgroundColor: _selectValue == index + 1
                                ? _activeColor
                                : Color.fromRGBO(195, 195, 195, 1),
                            radius: 5,
                          ),
                        ),
                        Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
