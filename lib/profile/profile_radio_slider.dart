import 'package:flutter/material.dart';

class ProfileRadioSlider extends StatefulWidget {
  final int _count;

  final Color _activeColor;
  final Function _handleChange;
  final int _value;

  ProfileRadioSlider({
    Key key,
    @required int count,
    @required Color activeColor,
    @required Function handleChange,
    @required int value,
  })  : assert(count != null),
        _count = count,
        assert(activeColor != null),
        _activeColor = activeColor,
        assert(handleChange != null),
        _handleChange = handleChange,
//        assert(value != null),

        _value = value,
        super(key: key);

  @override
  _ProfileRadioSliderState createState() => _ProfileRadioSliderState();
}

class _ProfileRadioSliderState extends State<ProfileRadioSlider> {
  int get _count => widget._count;

  Color get _activeColor => widget._activeColor;

  Function get _handleParentChange => widget._handleChange;

  int get _value => widget._value;

  int _selectValue;

  @override
  void initState() {
    super.initState();
  }

  void _handleChange(int value) {
    setState(() {
      _selectValue = value;
    });
    _handleParentChange(value);
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
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(195, 195, 195, 1),
                            radius: 7,
                            child: CircleAvatar(
                              backgroundColor: _selectValue == index + 1
                                  ? _activeColor
                                  : Color.fromRGBO(195, 195, 195, 1),
                              radius: 5,
                            ),
                          ),
                          onTap: () {
                            _handleChange(index + 1);
                          },
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
