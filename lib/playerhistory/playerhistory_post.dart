import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/model/playerHistory.dart';
import 'package:with_flutter/playerhistory/playerhistory.dart';

import 'bloc/bloc.dart';

class PlayerHistoryPost extends StatefulWidget {
  PlayerHistoryPost({
    Key key,
  }) : super(key: key);

  @override
  State<PlayerHistoryPost> createState() => _PlayerHistoryPostState();
}

class _PlayerHistoryPostState extends State<PlayerHistoryPost> {
  PlayerHistoryBloc _playerHistoryBloc;

  @override
  void initState() {
    super.initState();
    _playerHistoryBloc = BlocProvider.of<PlayerHistoryBloc>(context);
    _playerHistoryBloc.add(PlayerHistoryLoad());

  }

  List<PlayerHistory> _playerHistoryList = [];

  List<HistoryCard> _historyCardList = [];

  void _addHistoryCard() {
    TextEditingController _leagueNameController = TextEditingController();
    TextEditingController _selectionPlayCountController =
        TextEditingController();
    TextEditingController _playCountController = TextEditingController();
    TextEditingController _goalCountController = TextEditingController();
    TextEditingController _assistCountController = TextEditingController();
    TextEditingController _yellowCardCountController = TextEditingController();
    TextEditingController _redCardCountController = TextEditingController();
    setState(() {
      _historyCardList.add(
        new HistoryCard(
          (_historyCardList.length + 1) * -1,
          PlayerHistoryCard(
            key: GlobalKey<FormFieldState>(),
            index: (_historyCardList.length + 1) * -1,
            delete: _removeHistoryCard,
            setYear: _setYear,
            leagueNameController: _leagueNameController,
            selectionPlayCountController: _selectionPlayCountController,
            playCountController: _playCountController,
            goalCountController: _goalCountController,
            assistCountController: _assistCountController,
            yellowCardCountController: _yellowCardCountController,
            redCardCountController: _redCardCountController,
          ),
          _leagueNameController,
          _selectionPlayCountController,
          _playCountController,
          _goalCountController,
          _assistCountController,
          _yellowCardCountController,
          _redCardCountController,
        ),
      );
    });
  }

  HistoryCard _makeHistoryCard(PlayerHistory playerHistory) {
    TextEditingController _leagueNameController = TextEditingController();
    TextEditingController _selectionPlayCountController =
        TextEditingController();
    TextEditingController _playCountController = TextEditingController();
    TextEditingController _goalCountController = TextEditingController();
    TextEditingController _assistCountController = TextEditingController();
    TextEditingController _yellowCardCountController = TextEditingController();
    TextEditingController _redCardCountController = TextEditingController();
    HistoryCard historyCard = new HistoryCard(
      playerHistory.id,
      PlayerHistoryCard(
        key: GlobalKey<FormFieldState>(),
        index: playerHistory.id,
        delete: _removeHistoryCard,
        setYear: _setYear,
        leagueNameController: _leagueNameController,
        selectionPlayCountController: _selectionPlayCountController,
        playCountController: _playCountController,
        goalCountController: _goalCountController,
        assistCountController: _assistCountController,
        yellowCardCountController: _yellowCardCountController,
        redCardCountController: _redCardCountController,
        playerHistory: playerHistory,
      ),
      _leagueNameController,
      _selectionPlayCountController,
      _playCountController,
      _goalCountController,
      _assistCountController,
      _yellowCardCountController,
      _redCardCountController,
    );
    if (playerHistory.playYear != null) {
      historyCard.setPlayYear(playerHistory.playYear);
    }

    return historyCard;
  }

  void _removeHistoryCard(int index) {
    int findIndex = -1;
    for (int i = 0; i < _historyCardList.length; i++) {
      if (_historyCardList[i].index == index) {
        findIndex = i;
      }
    }

    if (findIndex > -1) {
      setState(() {
        _historyCardList.removeAt(findIndex);
      });
    }
  }

  void _setYear(int index, String value) {
    print("]-----] _setYear.value [-----[ ${value}");
    for (int i = 0; i < _historyCardList.length; i++) {
      if (_historyCardList[i].index == index) {
        _historyCardList[i].setPlayYear(value);
      }
    }
  }

  _saveHistory() {
    print(
        "]-----] _saveHistory.playYear [-----[ ${_historyCardList[0].playYear}");

    if (_historyCardList.length > 0) {
      List<PlayerHistory> playerHistories = [];
      for (int i = 0; i < _historyCardList.length; i++) {
        if (_historyCardList[i].playYear != null ||
            _historyCardList[i].leagueNameController.text.isNotEmpty ||
            _historyCardList[i].selectionPlayCountController.text.isNotEmpty ||
            _historyCardList[i].playCountController.text.isNotEmpty ||
            _historyCardList[i].goalCountController.text.isNotEmpty ||
            _historyCardList[i].assistCountController.text.isNotEmpty ||
            _historyCardList[i].yellowCardCountController.text.isNotEmpty ||
            _historyCardList[i].redCardCountController.text.isNotEmpty) {
          playerHistories.add(PlayerHistory(
            id: _historyCardList[i].index,
            playYear: _historyCardList[i].playYear,
            leagueName: _historyCardList[i].leagueNameController.text,
            selectionPlayCount:
                _historyCardList[i].selectionPlayCountController.text != null
                    ? int.tryParse(
                        _historyCardList[i].selectionPlayCountController.text)
                    : null,
            playCount: _historyCardList[i].playCountController.text != null
                ? int.tryParse(_historyCardList[i].playCountController.text)
                : null,
            goalCount: _historyCardList[i].goalCountController.text != null
                ? int.tryParse(_historyCardList[i].goalCountController.text)
                : null,
            assistCount: _historyCardList[i].assistCountController.text != null
                ? int.tryParse(_historyCardList[i].assistCountController.text)
                : null,
            yellowCardCount:
                _historyCardList[i].yellowCardCountController.text != null
                    ? int.tryParse(
                        _historyCardList[i].yellowCardCountController.text)
                    : null,
            redCardCount: _historyCardList[i].redCardCountController.text !=
                    null
                ? int.tryParse(_historyCardList[i].redCardCountController.text)
                : null,
          ));
        }
      }
//      print(playerHistories);
      if (playerHistories.length > 0) {
        _playerHistoryBloc
            .add(PlayerHistorySave(playerHistories: playerHistories));
      } else {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Text("올바른 값을 입력해 주세요."),
                    ],
                  ),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.red,
            ),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: 삭제기능 추가할 것
    return BlocListener<PlayerHistoryBloc, PlayerHistoryState>(
      listener: (context, state) {
        if (state.isLoaded) {
          if (state.playerHistories != null) {
            if (state.playerHistories.length > 0) {
              List<HistoryCard> _historyCardListTmp = [];
              for (int i = 0; i < state.playerHistories.length; i++) {
                _historyCardListTmp
                    .add(_makeHistoryCard(state.playerHistories[i]));
              }
              setState(() {
                _historyCardList = _historyCardListTmp;
              });
//              Navigator.pop(context, state.playerHistories.length);

            } else {
              _addHistoryCard();
            }
          } else {
            _addHistoryCard();
          }
        }

        if (state.isSaveButtonPressed) {
          _saveHistory();
        }

        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('저장중...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
      },
      child: BlocBuilder<PlayerHistoryBloc, PlayerHistoryState>(
        builder: (context, state) {
          return Container(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _historyCardList.length > 0
                        ? Column(
                            children: _historyCardList.map((card) {
                              return card.playerHistoryCard;
                            }).toList(),
                          )
                        : Text(""),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Color(0xffdedede),
                              ),
                              iconSize: 80,
                              onPressed: _addHistoryCard,
                            ),
                            Text(
                              "내용 추가하기",
                              style: TextStyle(
                                color: Color.fromRGBO(124, 124, 124, 1),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Medium",
                                fontStyle: FontStyle.normal,
                                fontSize: 11.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

class HistoryCard {
  final int index;
  final PlayerHistoryCard playerHistoryCard;
  String playYear;
  final TextEditingController leagueNameController;
  final TextEditingController selectionPlayCountController;
  final TextEditingController playCountController;
  final TextEditingController goalCountController;
  final TextEditingController assistCountController;
  final TextEditingController yellowCardCountController;
  final TextEditingController redCardCountController;

  setPlayYear(String value) {
    this.playYear = value;
  }

  HistoryCard(
    this.index,
    this.playerHistoryCard,
    this.leagueNameController,
    this.selectionPlayCountController,
    this.playCountController,
    this.goalCountController,
    this.assistCountController,
    this.yellowCardCountController,
    this.redCardCountController,
  );

  @override
  String toString() => 'HistoryCard { index: $index }';
}
