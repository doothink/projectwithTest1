import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';

import 'bloc/bloc.dart';
import 'search.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      builder: (context) => SearchBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
      child: SearchMain(),
    );
  }
}
