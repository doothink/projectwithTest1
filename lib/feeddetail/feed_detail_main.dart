import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/feeddetail/bloc/bloc.dart';
import 'package:with_flutter/feeddetail/feed_detail_top_banner.dart';
import 'package:with_flutter/model/feed.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FeedDetailMain extends StatefulWidget {
  final int _feedId;
  final Function _setAvatar;

  FeedDetailMain({
    Key key,
    @required int feedId,
    @required Function setAvatar,
  })  : assert(feedId != null),
        _feedId = feedId,
        assert(setAvatar != null),
        _setAvatar = setAvatar,
        super(key: key);

  @override
  State<FeedDetailMain> createState() => _FeedDetailMainState();
}

class _FeedDetailMainState extends State<FeedDetailMain> {
  FeedDetailBloc _feedDetailBloc;

  int get _feedId => widget._feedId;

  Function get _setAvatar => widget._setAvatar;

  Feed _feed;
  String _mediaType = "IMAGE";

  @override
  void initState() {
    super.initState();

    _feedDetailBloc = BlocProvider.of<FeedDetailBloc>(context);
    _feedDetailBloc.add(FeedDetailLoad(feedId: _feedId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedDetailBloc, FeedDetailState>(
      listener: (context, state) {
        if (state.isLoaded) {
          debugPrint("]-----] state.feed [-----[ ${state.feed}");
          _feed = state.feed;
          _mediaType = state.feed.mediaCollections[0].mediaType;
          _setAvatar(_createAvater(state.feed));
        }
      },
      child: BlocBuilder<FeedDetailBloc, FeedDetailState>(
        builder: (context, state) {
          return _feed != null
              ? Container(
                  width: MediaQuery.of(context).size.width,
//                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      _mediaType == "YOUTUBE"
                          ? _feed.mediaCollections != null &&
                                  _feed.mediaCollections[0] != null &&
                                  _feed.mediaCollections[0].fullPath != null
                              ? YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId:
                                        YoutubePlayer.convertUrlToId(
                                            _feed.mediaCollections[0].fullPath),
                                    flags: YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: false,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                )
                              : Text(
                                  "",
                                  style: TextStyle(height: 0),
                                )
                          : FeedDetailTopBanner(
                              mediaCollections: _feed.mediaCollections,
                            ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 12),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_feed.member.firstName}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Bold",
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                DateUtils.getCreatedTime(_feed.createdAt),
                                style: const TextStyle(
                                  color: Color.fromRGBO(152, 152, 152, 1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Bold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 12),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_feed.title}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                _feed.contents,
                                style: const TextStyle(
                                  color: Color.fromRGBO(152, 152, 152, 1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr-Regular",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
              : Text("");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _createAvater(Feed feed) {
    return Stack(children: [
      CircleAvatar(
        radius: 17.5,
        child: ClipOval(
          child: _feed != null &&
                  feed.memberProfile != null &&
                  feed.memberProfile.mediaCollections != null &&
                  feed.memberProfile.mediaCollections[0] != null
              ? CachedNetworkImage(
                  width: 35.0,
                  height: 35.0,
                  imageUrl: _feed.memberProfile.mediaCollections[0].fullPathS3,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                )
              : Image.asset(
                  'assets/images/nophoto@3x.png',
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.cover,
                ),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 4.0,
        ),
      ),
    ]);
  }
}
