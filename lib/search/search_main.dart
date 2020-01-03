import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/search/search_default.dart';
import 'package:with_flutter/searchresult/search.dart';
import 'package:with_flutter/searchtotal/search_total_screen.dart';

import 'bloc/bloc.dart';

class SearchMain extends StatefulWidget {
  SearchMain({
    Key key,
  }) : super(key: key);

  @override
  State<SearchMain> createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();

    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  String _searchValue;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.isLoaded) {
          debugPrint("]-----] state.isLoaded [-----[");
        }
        debugPrint("]-----] state.isLoaded [-----[ ${state.status}");
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          List<Widget> widgets = [
            SearchDefault(
              onPressed: _setSearchValueHashtag,
            ),
            SearchResultScreen(
              searchValue: state.searchValue != null ? state.searchValue : "",
            ),
            SearchTotalScreen(
              searchValue: state.searchValue != null ? state.searchValue : "",
            ),
          ];
          return Scaffold(
            backgroundColor: Color.fromRGBO(234, 234, 234, 1),
            appBar: AppBar(
              automaticallyImplyLeading: false,
//              leading: IconButton(
//                icon: Icon(
//                  Icons.search,
//                  color: Color.fromRGBO(147, 147, 147, 1),
//                ),
//                iconSize: 26,
//                onPressed: () {
////                  _scaffoldKey.currentState.openEndDrawer();
//                },
//              ),
              backgroundColor: Colors.white,
              title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    onFieldSubmitted: (term) {
                      _setSearchValue();
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "검색",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: const Color.fromRGBO(222, 222, 222, 1),
                      ),
                      prefixIcon: IconButton(
                        iconSize: 30,
                        padding: EdgeInsets.all(1),
                        icon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(147, 147, 147, 1),
                        ),
                        onPressed: _setSearchValue,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              iconSize: 20,
                              padding: EdgeInsets.all(1),
                              icon: Icon(
                                Icons.close,
                                color: Color.fromRGBO(147, 147, 147, 1),
                              ),
                              onPressed: _setDefault,
                            )
                          : EmptyWidget(),
                    ),
                  )),
//        actions: <Widget>[],
            ),
            body: Container(
              padding: EdgeInsets.only(top: 13, left: 15, right: 15),
              child: widgets[state.status],
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

  _setSearchValueHashtag(String value) {
//    print(value);
    setState(() {
      _searchController.text = value;
    });
    _searchBloc.add(SearchHashtagLoad(searchValue: value, status: 1));
  }

  _setDefault() {
    print("]-----] _setDefault [-----[ call");
    Future.delayed(Duration(milliseconds: 50)).then((_) {
      _searchController.clear();
      FocusScope.of(context).unfocus();
    });

    _searchBloc.add(SearchInit());
  }

  _setSearchValue() {
    print("]-----] _searchController [-----[ ${_searchController.text}");
    _searchBloc.add(SearchLoad(searchValue: _searchController.text, status: 2));
  }
}
