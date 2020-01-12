import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'search.dart';

class SearchTotalScreen extends StatelessWidget {
  final String _searchValue;
  final SearchTotalBloc _searchTotalBloc;

  SearchTotalScreen({
    Key key,
    @required String searchValue,
    @required SearchTotalBloc searchTotalBloc,
  })  : assert(searchValue != null),
        _searchValue = searchValue,
        assert(searchTotalBloc != null),
        _searchTotalBloc = searchTotalBloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchTotalBloc>(
      builder: (context) => _searchTotalBloc,
      child: SearchTotalMain(searchValue: _searchValue),
    );
  }
}
