import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/feed/feed_card.dart';
import 'package:with_flutter/feeddetail/bloc/bloc.dart';
import 'package:with_flutter/feeddetail/feed_detail_top_banner.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'bloc_recommand/bloc.dart';

class FeedRecommand extends StatefulWidget {
  FeedRecommand({
    Key key,
  }) : super(key: key);

  @override
  State<FeedRecommand> createState() => _FeedRecommandState();
}

class _FeedRecommandState extends State<FeedRecommand> {
  FeedRecommandBloc _feedRecommandBloc;

  String _mediaType = "IMAGE";

  @override
  void initState() {
    super.initState();

    _feedRecommandBloc = FeedRecommandBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    _feedRecommandBloc.add(FeedRecommandLoad(size: 4));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedRecommandBloc>(
      builder: (context) => _feedRecommandBloc,
      child: BlocListener<FeedRecommandBloc, FeedRecommandState>(
        listener: (context, state) {
          if (state.isLoaded) {}
        },
        child: BlocBuilder<FeedRecommandBloc, FeedRecommandState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              color: Color.fromRGBO(248, 248, 248, 1),
//              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                    child: Text(
                      "유사한 게시물 더 보기",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  StaggeredGridView.countBuilder(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 3.0,
                    crossAxisSpacing: 3.0,
                    itemCount: state.feeds != null ? state.feeds.length : 0,
                    itemBuilder: (BuildContext context, int index) => FeedCard(
                      feed: state.feeds[index],
                    ),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
