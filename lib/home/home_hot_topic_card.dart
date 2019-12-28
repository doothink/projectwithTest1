import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/home/home.dart';
import 'package:with_flutter/model/with_card.dart';

class HomeHotTopicCard extends StatefulWidget {
  final WithCard _withCard;

  HomeHotTopicCard({Key key, @required WithCard withCard})
      : assert(withCard != null),
        _withCard = withCard,
        super(key: key);

  State<HomeHotTopicCard> createState() => _HomeHotTopicCardState();
}

class _HomeHotTopicCardState extends State<HomeHotTopicCard> {
  HomeBloc _homeBloc;

  WithCard get _withCard => widget._withCard;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                    height: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/dump/${_withCard.imageUrl}'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    right: 6.0,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 3.0, bottom: 3.0, left: 5.0, right: 5.0),
                      decoration:
                          BoxDecoration(color: Colors.black12.withOpacity(0.2)),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage(
                                  'assets/images/icons/filledHeart341288@3x.png'),
                              width: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(
                                "55",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 8.0, right: 10.0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _withCard.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        _withCard.name,
                        style: const TextStyle(
                          color: Color.fromRGBO(121, 121, 121, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
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
