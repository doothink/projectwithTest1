import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';

import 'bloc_phone_cert.dart';

class PhoneCertBloc extends Bloc<PhoneCertEvent, PhoneCertState> {
  final AuthenticationBloc _authenticationBloc;

  PhoneCertBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  PhoneCertState get initialState => PhoneCertState.empty();

  @override
  Stream<PhoneCertState> transformEvents(
    Stream<PhoneCertEvent> events,
    Stream<PhoneCertState> Function(PhoneCertEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PhoneCertEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<PhoneCertState> mapEventToState(PhoneCertEvent event) async* {
    if (event is PhoneCertReq) {
      yield* _mapPhoneCertReqToState(event.phoneNember);
    }
    if (event is PhoneCertConfirm) {
      yield* _mapPhoneCertConfirmToState(event.phoneNember, event.certNumber);
    }
  }

  Stream<PhoneCertState> _mapPhoneCertReqToState(String phoneNember) async* {
    yield PhoneCertState.loading();
    try {
      String body = json.encode({
        "sendedPhoneNumber": phoneNember,
        "certType": "PHONE",
      });
      final response = await _authenticationBloc.post('/api/cert/send', body);
      if (response != null) {
        yield PhoneCertState.success();
      }
    } catch (e) {
      print("]-----] error [-----[ ${e}");
      yield PhoneCertState.failure();
    }
  }

  Stream<PhoneCertState> _mapPhoneCertConfirmToState(
    String phoneNember,
    String certNumber,
  ) async* {
    yield PhoneCertState.certLoading();
    try {
      String body = json.encode({
        "sendedPhoneNumber": phoneNember,
        "certNumber": certNumber,
        "certType": "PHONE",
      });
      final response =
          await _authenticationBloc.post('/api/cert/confirm', body);
      print(response);
      if (response != null) {
        yield PhoneCertState.certSuccess();
      }
    } catch (error) {

      yield PhoneCertState.certFailure(error.message);
    }
  }
}
