import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/club/club.dart';
import 'package:with_flutter/model/club.dart';

import 'club_top_banner.dart';

class ClubHashTag extends StatefulWidget {
  final String _hashTag;

  ClubHashTag({Key key, @required String hashTag})
      : assert(hashTag != null),
        _hashTag = hashTag,
        super(key: key);

  @override
  State<ClubHashTag> createState() => _ClubHashTagState();
}

class _ClubHashTagState extends State<ClubHashTag> {
  String get _hashTag => widget._hashTag;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClubBloc, ClubState>(
      listener: (context, state) {},
      child: BlocBuilder<ClubBloc, ClubState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.centerLeft,
//            padding: EdgeInsets.only(left: 20, right: 20),
            child: Wrap(
//              alignment: WrapAlignment.end,
              spacing: 7.0, // gap between adjacent chips
              runSpacing: 7.0, // gap between lines
              children: createChildrenTexts(),
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

  List<Container> createChildrenTexts() {
    List<String> list = _hashTag.split(",");
//    List<String> list = ['one', 'two', 'the', 'four','four','four','four','four','four','four','four'];

    return list
        .map((text) => Container(
              padding: EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 10.0, bottom: 12.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(48, 190, 157, 1),
              ),
//              margin: EdgeInsets.only(right: 7.0),
              child: Text(
                "#$text",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr-Bold",
                  fontStyle: FontStyle.normal,
                  fontSize: 11.0,
                ),
              ),
            ))
        .toList();
  }
}
