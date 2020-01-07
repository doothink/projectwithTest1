import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/date_util.dart';
import 'package:with_flutter/common/empty.dart';
import 'package:with_flutter/model/notice.dart';
import 'package:with_flutter/notice/bloc/bloc.dart';
import 'package:with_flutter/noticedetail/notice_detail.dart';

class NoticeMain extends StatefulWidget {
  NoticeMain({
    Key key,
  }) : super(key: key);

  @override
  State<NoticeMain> createState() => _NoticeMainState();
}

class _NoticeMainState extends State<NoticeMain> {
  NoticeBloc _noticeBloc;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  List<Notice> _notices;
  String _mediaType = "IMAGE";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _noticeBloc = BlocProvider.of<NoticeBloc>(context);
    _noticeBloc.add(NoticeLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoticeBloc, NoticeState>(
      listener: (context, state) {
        if (state.isLoaded) {
          setState(() {
            _notices = state.notices;
          });
        }
      },
      child: BlocBuilder<NoticeBloc, NoticeState>(
        builder: (context, state) {
          return Container(
            color: Color.fromRGBO(248, 248, 248, 1),
            child: _notices != null && _notices.length > 0
                ? Container(
                    child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(0),
                        itemCount: _notices != null
                            ? state.hasReachedMax
                                ? _notices.length
                                : _notices.length + 1
                            : 0,
                        itemBuilder: (BuildContext context, int index) =>
                            index >= _notices.length
                                ? BottomLoader()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NoticeDetailScreen(
                                                  noticeId: _notices[index].id,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: Color.fromRGBO(
                                                  124, 124, 124, 1)),
                                        ),
                                        color: Color.fromRGBO(248, 248, 248, 1),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 25,
                                          right: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${DateUtils.getApplyTime(_notices[index].createdAt)}',
                                            style: const TextStyle(
                                                color: const Color(0xffa8a8a8),
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    "NotoSansCJKkr-Regular",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 11.0),
                                          ),
                                          Text(
                                            _notices[index].title,
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(88, 88, 88, 1),
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  "NotoSansCJKkr-Medium",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                  )
                : EmptyWidget(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _noticeBloc.add(NoticeLoad());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
