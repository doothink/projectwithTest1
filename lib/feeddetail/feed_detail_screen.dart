import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/common/empty.dart';

import 'bloc/bloc.dart';
import 'feed_detail.dart';

class FeedDetailScreen extends StatefulWidget {
  final int _feedId;

  FeedDetailScreen({
    Key key,
    @required int feedId,
  })  : assert(feedId != null),
        _feedId = feedId,
        super(key: key);

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  int get _feedId => widget._feedId;
  Widget _avatar;

  _setAvatar(Widget avatar) {
    setState(() {
      _avatar = avatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: _avatar != null ? _avatar : EmptyWidget(),
//        actions: <Widget>[],
      ),
      body: BlocProvider<FeedDetailBloc>(
          builder: (context) => FeedDetailBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: FeedDetailMain(feedId: _feedId, setAvatar: _setAvatar)),
    );
  }
}
