import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/mypage/mypage.dart';

class MyPageBloc extends Bloc<MyPageEvent, MyPageState> {
  final AuthenticationBloc _authenticationBloc;

  MyPageBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  MyPageState get initialState => MyPageState.empty();

  @override
  Stream<MyPageState> transformEvents(
    Stream<MyPageEvent> events,
    Stream<MyPageState> Function(MyPageEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<MyPageEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<MyPageState> mapEventToState(MyPageEvent event) async* {
    if (event is MyPageLoad) {
//      final mypage = await _fetchMyPage(event.mypageId);
      debugPrint("]-----] mapEventToState::mypage [-----[ ${event}");
    }
  }
}
