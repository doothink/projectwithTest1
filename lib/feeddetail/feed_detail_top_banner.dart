import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/club/club.dart';
import 'package:with_flutter/model/mediaCollection.dart';

import 'bloc/bloc.dart';

class FeedDetailTopBanner extends StatefulWidget {
  final List<MediaCollection> _mediaCollections;

  FeedDetailTopBanner({Key key, @required List<MediaCollection> mediaCollections})
      : assert(mediaCollections != null),
        _mediaCollections = mediaCollections,
        super(key: key);

  State<FeedDetailTopBanner> createState() => _FeedDetailTopBannerState();
}

class _FeedDetailTopBannerState extends State<FeedDetailTopBanner> {
  List<MediaCollection> get _mediaCollections => widget._mediaCollections;

  @override
  void initState() {
    super.initState();
  }

  final _controllerTopBanner = PageController();
  Color gradientStart = Colors.black.withOpacity(0.7);
  Color gradientEnd = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = _mediaCollections
        .map(
          (media) => Container(
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [gradientStart, gradientEnd],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(media.fullPathS3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();

    return BlocListener<FeedDetailBloc, FeedDetailState>(
      listener: (context, state) {},
      child: BlocBuilder<FeedDetailBloc, FeedDetailState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 220.0,
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: _controllerTopBanner,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: _pages,
                  scrollDirection: Axis.horizontal,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
//                      color: Colors.grey[800].withOpacity(0.4),
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: DotsIndicator(
                        controller: _controllerTopBanner,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controllerTopBanner.animateToPage(
                            page,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
