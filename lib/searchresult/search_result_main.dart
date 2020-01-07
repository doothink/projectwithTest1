import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/searchresult/search_result_jobinfo_card.dart';

import 'bloc/bloc.dart';

class SearchResultMain extends StatefulWidget {
  final String _searchValue;

  SearchResultMain({
    Key key,
    @required String searchValue,
  })  : assert(searchValue != null),
        _searchValue = searchValue,
        super(key: key);

  @override
  State<SearchResultMain> createState() => _SearchResultMainState();
}

class _SearchResultMainState extends State<SearchResultMain> {
  SearchResultBloc _searchBloc;

  String get _searchValue => widget._searchValue;

  @override
  void initState() {
    super.initState();

    _searchBloc = BlocProvider.of<SearchResultBloc>(context);
    _searchBloc.add(SearchResultLoad(searchValue: _searchValue));
  }

  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width / 2;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;

    return BlocListener<SearchResultBloc, SearchResultState>(
      listener: (context, state) {
        if (state.isLoaded) {
//          debugPrint("]-----] state.isLoaded [-----[ $_searchValue");
//          debugPrint("]-----] state.isLoaded [-----[ ${state.jobInfos}");
        }
      },
      child: BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) {
          return Container(
//            padding: EdgeInsets.only(top: 13, left: 15, right: 15),
            child: state.jobInfos != null && state.jobInfos.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      childAspectRatio: cardWidth / cardHeight,
                      children: List.generate(state.jobInfos.length, (index) {
                        return SearchResultJobInfoCard(
                          cardHeight: cardHeight,
                          jobInfo: state.jobInfos[index],
                        );
                      }),
                    ),
                  )
                : Container(
                    child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Image(
                        image: AssetImage('assets/images/search-nodata@3x.png'),
                        width: 181,
                        height: 156,
                      ),
                    ),
                  )),
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
