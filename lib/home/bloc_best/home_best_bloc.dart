import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/models.dart';

import 'bloc.dart';

class HomeBestBloc extends Bloc<HomeBestEvent, HomeBestState> {
  final AuthenticationBloc _authenticationBloc;

  HomeBestBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeBestState get initialState => HomeBestState.empty();

  @override
  Stream<HomeBestState> transformEvents(
    Stream<HomeBestEvent> events,
    Stream<HomeBestState> Function(HomeBestEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<HomeBestEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeBestState> mapEventToState(HomeBestEvent event) async* {
    if (event is MembersLoad) {
      yield* _mapMembersLoadToState(event.size);
    }
  }

  Stream<HomeBestState> _mapMembersLoadToState(int size) async* {
//    print("]-----] _mapMembersTopLoadToState call [-----[ ${size}");
    try {
      final response =
          await _authenticationBloc.get('/api/membermain?pageSize=$size');
      final contents = response['content'] as List;
      final List<Member> members = contents.map((data) {
        return Member.fromJson(data);
      }).toList();

      yield HomeBestState.loaedSuccess(members);
    } catch (error) {
      print("]-----] _mapMembersTopLoadToState.error [-----[ ${error}");
      yield HomeBestState.failure();
    }
  }
}
