import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/profile.dart';

import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthenticationBloc _authenticationBloc;

  ProfileBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ProfileState get initialState => ProfileState.empty();

  @override
  Stream<ProfileState> transformEvents(
    Stream<ProfileEvent> events,
    Stream<ProfileState> Function(ProfileEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<ProfileEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileLoad) {
      yield* _mapProfileLoadToState();
    } else if (event is PhoneCerted) {
      yield* _mapPhoneCertToState();
    } else if (event is ProfileSaveButtonPressed) {
      yield* _mapProfileSaveButtonPressedToState(event.viewYn);
    } else if (event is ProfileSave) {
      yield* _mapProfileSave(event.viewYn, event.profile);
    } else if (event is ProfileInit) {
      yield* _mapProfileInit();
    }
  }

  Stream<ProfileState> _mapProfileLoadToState() async* {
    yield ProfileState.loading();
    try {
      final response = await _authenticationBloc.get('/api/memberprofile');
//      print("]-----] _mapProfileLoadToState::response [-----[ ${response}");
      if (response != null) {
        final profile = Profile.fromJson(response);
        yield ProfileState.success(profile);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield ProfileState.failure();
    }
  }

  Stream<ProfileState> _mapPhoneCertToState() async* {
    yield state.updatePhoneCert(isPhoneCerted: true);
  }

  Stream<ProfileState> _mapProfileSaveButtonPressedToState(bool viewYn) async* {
    yield state.updateSaveButtonPressed(
        isSaveBottonPressed: true, isView: viewYn);
  }

  Stream<ProfileState> _mapProfileSave(
    bool viewYn,
    Profile profile,
  ) async* {
    state.updateLoading(isLoaaing: true);
    try {
      String body = json.encode(profile);
      final response =
          await _authenticationBloc.post('/api/memberprofile', body);
      if (response != null) {
        yield state.updateSaveSuccess(isSaveSuccess: true);
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield ProfileState.failure();
    }
  }

  Stream<ProfileState> _mapProfileInit() async* {
    yield ProfileState.empty();
  }
}
