import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/common/common.dart';
import 'package:with_flutter/model/mediaCollection.dart';

import 'jobinfo.dart';

class JobInfoTopBanner extends StatefulWidget {
  final List<MediaCollection> _mediaCollections;

  JobInfoTopBanner({Key key, @required List<MediaCollection> mediaCollections})
      : assert(mediaCollections != null),
        _mediaCollections = mediaCollections,
        super(key: key);

  State<JobInfoTopBanner> createState() => _JobInfoTopBannerState();
}

class _JobInfoTopBannerState extends State<JobInfoTopBanner> {
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

    return BlocListener<JobInfoBloc, JobInfoState>(
      listener: (context, state) {},
      child: BlocBuilder<JobInfoBloc, JobInfoState>(
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
