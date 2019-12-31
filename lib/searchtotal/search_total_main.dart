import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/club/club_screen.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/searchresult/search_result_jobinfo_card.dart';

import 'bloc/bloc.dart';

class SearchTotalMain extends StatefulWidget {
  final String _searchValue;

  SearchTotalMain({
    Key key,
    @required String searchValue,
  })  : assert(searchValue != null),
        _searchValue = searchValue,
        super(key: key);

  @override
  State<SearchTotalMain> createState() => _SearchTotalMainState();
}

class _SearchTotalMainState extends State<SearchTotalMain> {
  SearchTotalBloc _searchBloc;

  String get _searchValue => widget._searchValue;

  @override
  void initState() {
    super.initState();

    _searchBloc = BlocProvider.of<SearchTotalBloc>(context);
    debugPrint("]-----] state._searchValue [-----[ $_searchValue");
    _searchBloc.add(SearchTotalLoad(searchValue: _searchValue));
//    _searchValueCurrent = _searchValue;
  }

  String _searchValueCurrent;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchTotalBloc, SearchTotalState>(
      listener: (context, state) {
        if (state.isLoaded) {}
      },
      child: BlocBuilder<SearchTotalBloc, SearchTotalState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
//            padding: EdgeInsets.only(top: 13, left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("인물 검색결과",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0,
                                    )),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.66,
                                  child: Divider(
//                                          thickness: 4,
                                    color: Color.fromRGBO(88, 88, 88, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        state.members != null && state.members.length > 0
                            ? Container(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: state.members
                                        .map((item) => Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Column(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    child: CircleAvatar(
                                                      radius: 42.5,
                                                      child: ClipOval(
                                                        child: item.memberProfile
                                                                        .mediaCollections !=
                                                                    null &&
                                                                item.memberProfile
                                                                            .mediaCollections[
                                                                        0] !=
                                                                    null &&
                                                                item
                                                                        .memberProfile
                                                                        .mediaCollections[
                                                                            0]
                                                                        .fullPathS3 !=
                                                                    null
                                                            ? CachedNetworkImage(
                                                                width: 85.0,
                                                                height: 85.0,
                                                                imageUrl: item
                                                                    .memberProfile
                                                                    .mediaCollections[
                                                                        0]
                                                                    .fullPathS3,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    new CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    new Icon(Icons
                                                                        .error),
                                                              )
                                                            : Image.asset(
                                                                'assets/images/nophoto@3x.png',
                                                                width: 85.0,
                                                                height: 85.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(item.nickName)
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )
                            : EmptyWidget(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("구단 검색결과",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0,
                                    )),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.66,
                                  child: Divider(
//                                          thickness: 4,
                                    color: Color.fromRGBO(88, 88, 88, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        state.clubs != null && state.clubs.length > 0
                            ? Container(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: state.clubs
                                        .map((item) => Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Column(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    ClubScreen(
                                                                      clubId:
                                                                          item.id,
                                                                    )),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                      radius: 42.5,
                                                      child: ClipOval(
                                                        child: item.symbolImageUrl !=
                                                                null
                                                            ? CachedNetworkImage(
                                                                width: 85.0,
                                                                height: 85.0,
                                                                imageUrl: item
                                                                    .symbolImageUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    new CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    new Icon(Icons
                                                                        .error),
                                                              )
                                                            : Image.asset(
                                                                'assets/images/nophoto@3x.png',
                                                                width: 85.0,
                                                                height: 85.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Text(
                                                      item.name,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            "NotoSansCJKkr-Medium",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              )
                            : EmptyWidget(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("직업 검색결과",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0,
                                    )),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.66,
                                  child: Divider(
//                                          thickness: 4,
                                    color: Color.fromRGBO(88, 88, 88, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        state.jobInfos != null && state.jobInfos.length > 0
                            ? GridView.count(
                                primary: false,
                                shrinkWrap: true,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                crossAxisCount: 2,
//                                childAspectRatio: 0.9,
                                children: List.generate(state.jobInfos.length,
                                    (index) {
                                  return SearchResultJobInfoCard(
                                    jobInfo: state.jobInfos[index],
                                  );
                                }),
                              )
                            : EmptyWidget(),
                      ],
                    ),
                  ),
                ],
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
}
