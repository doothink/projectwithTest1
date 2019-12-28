import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:with_flutter/feed/feed.dart';

import 'feed_card.dart';

class FeedMain extends StatefulWidget {
  FeedMain({
    Key key,
  }) : super(key: key);

  @override
  State<FeedMain> createState() => _FeedMainState();
}

class _FeedMainState extends State<FeedMain> {
  FeedBloc _feedBloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _feedBloc = BlocProvider.of<FeedBloc>(context);
    _feedBloc.add(FeedLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state.isLoaded) {
          debugPrint("]-----] state.feeds [-----[ ${state.feeds}");
        }
      },
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.of(context).size.height,
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 4,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              itemCount: state.feeds != null
                  ? state.hasReachedMax
                      ? state.feeds.length
                      : state.feeds.length + 1
                  : 0,
              itemBuilder: (BuildContext context, int index) =>
                  index >= state.feeds.length
                      ? BottomLoader()
                      : FeedCard(
                          feed: state.feeds[index],
                        ),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            ),
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
      _feedBloc.add(FeedLoad());
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
