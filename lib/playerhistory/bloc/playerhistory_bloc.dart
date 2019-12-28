import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/playerHistory.dart';

import 'bloc.dart';

class PlayerHistoryBloc extends Bloc<PlayerHistoryEvent, PlayerHistoryState> {
  final AuthenticationBloc _authenticationBloc;

  PlayerHistoryBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  PlayerHistoryState get initialState => PlayerHistoryState.empty();

  @override
  Stream<PlayerHistoryState> transformEvents(
    Stream<PlayerHistoryEvent> events,
    Stream<PlayerHistoryState> Function(PlayerHistoryEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PlayerHistoryEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<PlayerHistoryState> mapEventToState(PlayerHistoryEvent event) async* {
    if (event is PlayerHistoryLoad) {
      yield* _mapPlayerHistoryLoadToState();
    }
    if (event is PlayerHistorySaveButtonPressed) {
      yield* _mapPlayerHistorySaveButtonPressedToState();
    }
    if (event is PlayerHistorySave) {
      yield* _mapPlayerHistorySaveToState(event.playerHistories);
    }
  }

  Stream<PlayerHistoryState> _mapPlayerHistoryLoadToState() async* {
    yield PlayerHistoryState.loading();
    try {
      final response =
          await _authenticationBloc.get('/api/memberplayerhistory');
      if (response != null) {
        final contents = response['content'] as List;
        final List<PlayerHistory> playerHistoriesGet = contents.map((data) {
          return PlayerHistory.fromJson(data);
        }).toList();
        yield PlayerHistoryState.isLoaded(playerHistoriesGet);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield PlayerHistoryState.failure();
    }
  }

  Stream<PlayerHistoryState>
      _mapPlayerHistorySaveButtonPressedToState() async* {
//    yield PlayerHistoryState.loading();
    try {
      yield PlayerHistoryState.saveButtonPressed();
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield PlayerHistoryState.failure();
    }
  }

  Stream<PlayerHistoryState> _mapPlayerHistorySaveToState(
      List<PlayerHistory> playerHistories) async* {
    if (!state.isSubmitting) {
      yield PlayerHistoryState.isSaveLoading();

      try {
        String body = json.encode({
          "memberPlayerHistoryViews": playerHistories,
        });

        final response =
            await _authenticationBloc.post('/api/memberplayerhistory', body);

        if (response != null) {
          final contents = response['content'] as List;
          final List<PlayerHistory> playerHistoriesGet = contents.map((data) {
            return PlayerHistory.fromJson(data);
          }).toList();
          yield PlayerHistoryState.saveSuccess(playerHistoriesGet);
        }
      } catch (e) {
        print("]-----] error [-----[ ${e}");
        yield PlayerHistoryState.failure();
      }
    } else {
      print("isSubmitting");
    }
  }
}
