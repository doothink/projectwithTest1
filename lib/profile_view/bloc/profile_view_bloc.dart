import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/profile.dart';

import 'bloc.dart';

class ProfileViewBloc extends Bloc<ProfileViewEvent, ProfileViewState> {
  final AuthenticationBloc _authenticationBloc;

  ProfileViewBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ProfileViewState get initialState => ProfileViewState.empty();

  @override
  Stream<ProfileViewState> transformEvents(
    Stream<ProfileViewEvent> events,
    Stream<ProfileViewState> Function(ProfileViewEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<ProfileViewEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<ProfileViewState> mapEventToState(ProfileViewEvent event) async* {
    if (event is ProfileViewLoad) {
      yield* _mapProfileViewLoadToState(event.memberId);
    }
  }

  Stream<ProfileViewState> _mapProfileViewLoadToState(int memberId) async* {
    yield ProfileViewState.loading();
    try {
      final response =
          await _authenticationBloc.get('/api/memberprofile/${memberId}');
      if (response != null) {
        final profile = Profile.fromJson(response);
        yield ProfileViewState.success(profile);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield ProfileViewState.failure();
    }
  }
}
