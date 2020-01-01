import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/notice.dart';
import 'package:with_flutter/noticedetail/bloc/bloc.dart';

class NoticeDetailMain extends StatefulWidget {
  final int _noticeId;

  NoticeDetailMain({
    Key key,
    @required int noticeId,
  })  : assert(noticeId != null),
        _noticeId = noticeId,
        super(key: key);

  @override
  State<NoticeDetailMain> createState() => _NoticeDetailMainState();
}

class _NoticeDetailMainState extends State<NoticeDetailMain> {
  NoticeDetailBloc _noticeDetailBloc;

  int get _noticeId => widget._noticeId;

  Notice _notice;
  String _mediaType = "IMAGE";

  @override
  void initState() {
    super.initState();

    _noticeDetailBloc = BlocProvider.of<NoticeDetailBloc>(context);
    _noticeDetailBloc.add(NoticeDetailLoad(noticeId: _noticeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoticeDetailBloc, NoticeDetailState>(
      listener: (context, state) {
        if (state.isLoaded) {
          _notice = state.notice;
          _mediaType = state.notice.mediaCollections[0].mediaType;
        }
      },
      child: BlocBuilder<NoticeDetailBloc, NoticeDetailState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: _notice != null
                ? Container(
                    color: Color.fromRGBO(248, 248, 248, 1),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  DateUtils.getApplyTime(_notice.createdAt),
                                  style: TextStyle(
                                    color: Color.fromRGBO(124, 124, 124, 1),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Medium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  _notice.title,
                                  style: TextStyle(
                                    color: Color.fromRGBO(74, 74, 74, 1),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr-Medium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _notice.mediaCollections != null &&
                                  _notice.mediaCollections.length > 0
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
//                              height: 80.0,
//                              width: 80.0,
                                    imageUrl:
                                        _notice.mediaCollections[0].fullPathS3,
                                    placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                )
                              : EmptyWidget(),
                          _notice.contents != null
                              ? Container(
                                  padding: EdgeInsets.all(15.5),
                                  child: Text(
                                    _notice.contents,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                )
                              : EmptyWidget(),
                        ]),
                  )
                : EmptyWidget(),
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
