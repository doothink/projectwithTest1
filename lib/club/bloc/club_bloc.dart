import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/club/club.dart';
import 'package:with_flutter/model/models.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final AuthenticationBloc _authenticationBloc;

  ClubBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ClubState get initialState => ClubState.empty();

  @override
  Stream<ClubState> transformEvents(
    Stream<ClubEvent> events,
    Stream<ClubState> Function(ClubEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<ClubEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is ClubLoad) {
      yield* _mapClubLoadToState(event.clubId);
    }
  }

  Stream<ClubState> _mapClubLoadToState(int clubId) async* {
    yield ClubState.loading();
    try {
      final response = await _authenticationBloc.get('/api/club/$clubId');
      final club = Club.fromJson(response);
      yield ClubState.success(club);
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield ClubState.failure();
    }
  }
}
