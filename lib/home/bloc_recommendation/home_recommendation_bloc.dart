import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';

import 'package:with_flutter/model/models.dart';

import 'bloc.dart';

class HomeRecommendationBloc
    extends Bloc<HomeRecommendationEvent, HomeRecommendationState> {
  final AuthenticationBloc _authenticationBloc;

  HomeRecommendationBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeRecommendationState get initialState => HomeRecommendationState.empty();

  @override
  Stream<HomeRecommendationState> transformEvents(
    Stream<HomeRecommendationEvent> events,
    Stream<HomeRecommendationState> Function(HomeRecommendationEvent event)
        next,
  ) {
    return super.transformEvents(
      (events as Observable<HomeRecommendationEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeRecommendationState> mapEventToState(
      HomeRecommendationEvent event) async* {
    print("]-----] MembersTopLoad event [-----[ ${event}");
    if (event is MembersTopLoad) {
      print("]-----] MembersTopLoad call [-----[");
      yield* _mapMembersTopLoadToState(event.size);
    }
  }

  Stream<HomeRecommendationState> _mapMembersTopLoadToState(int size) async* {
//    print("]-----] _mapMembersTopLoadToState call [-----[ ${size}");
    try {
      final response =
          await _authenticationBloc.get('/api/membermain?pageSize=$size');
      final contents = response['content'] as List;
      final List<Member> members = contents.map((data) {
        return Member.fromJson(data);
      }).toList();
      print("]-----] _mapMembersTopLoadToState.members [-----[ ${members.length}");
      yield HomeRecommendationState.loaedSuccess(members);
    } catch (error) {
      print("]-----] _mapMembersTopLoadToState.error [-----[ ${error}");
      yield HomeRecommendationState.failure();
    }
  }
}
