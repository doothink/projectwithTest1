import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'search.dart';

class SearchResultScreen extends StatelessWidget {
  final String _searchValue;

  SearchResultScreen({
    Key key,
    @required String searchValue,
  })  : assert(searchValue != null),
        _searchValue = searchValue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchResultBloc>(
      builder: (context) => SearchResultBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
      child: SearchResultMain(searchValue: _searchValue),
    );
  }
}
