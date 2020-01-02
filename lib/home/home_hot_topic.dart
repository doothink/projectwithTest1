import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/authentication_bloc.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/common/string_util.dart';
import 'package:with_flutter/feeddetail/feed_detail_screen.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:with_flutter/model/with_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'bloc_feed/bloc.dart';
import 'home_hot_topic_card.dart';

class HomeHotTopic extends StatefulWidget {
  HomeHotTopic({
    Key key,
  }) : super(key: key);

  State<HomeHotTopic> createState() => _HomeHotTopicState();
}

class _HomeHotTopicState extends State<HomeHotTopic> {
  HomeFeedBloc _homeFeedBloc;

  @override
  void initState() {
    super.initState();
    _homeFeedBloc = HomeFeedBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
    _homeFeedBloc.add(FeedsLoad(size: 3));
  }

  List<Feed> _feeds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeFeedBloc>(
      builder: (context) => _homeFeedBloc,
      child: BlocListener<HomeFeedBloc, HomeFeedState>(
        listener: (context, state) {
          if (state.isLoaded) {
            _feeds = state.feeds;
          }
        },
        child: BlocBuilder<HomeFeedBloc, HomeFeedState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 10.0, left: 15.0, right: 15.0),
              decoration:
                  BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "인기 피드",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Bold",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  _feeds != null && _feeds.length > 0
                      ? Column(
                          children: _feeds
                              .map((item) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FeedDetailScreen(
                                                  feedId: item.id,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Stack(children: <Widget>[
                                            Container(
                                              height: 155.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: item.mediaCollections !=
                                                              null &&
                                                          item
                                                                  .mediaCollections
                                                                  .length >
                                                              0
                                                      ? item.mediaCollections[0]
                                                                      .mediaType ==
                                                                  'YOUTUBE' &&
                                                              item
                                                                      .mediaCollections[
                                                                          0]
                                                                      .fullPath !=
                                                                  null
                                                          ? CachedNetworkImageProvider(
                                                              "https://i3.ytimg.com/vi/${YoutubePlayer.convertUrlToId(item.mediaCollections[0].fullPath)}/mqdefault.jpg")
                                                          : CachedNetworkImageProvider(item
                                                              .mediaCollections[
                                                                  0]
                                                              .fullPathS3)
                                                      : EmptyWidget(),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 8.0,
                                                right: 10.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          item.title != null
                                                              ? item.title
                                                              : "No Title",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr-Bold",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0,
                                                          ),
                                                          maxLines: 2,
                                                        ),
                                                        Text(
                                                          item.contents != null
                                                              ? item.contents
                                                                          .length <
                                                                      20
                                                                  ? item
                                                                      .contents
                                                                  : StringUtils.runeSubstring(item.contents, 0, 19)

                                                              : "No Content",
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    121,
                                                                    121,
                                                                    121,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "NotoSansCJKkr-Regular",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 11.0,
                                                          ),
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      : EmptyWidget(),
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
