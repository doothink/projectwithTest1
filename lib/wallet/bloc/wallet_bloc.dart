import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';

import 'bloc.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final AuthenticationBloc _authenticationBloc;

  WalletBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  WalletState get initialState => WalletState.empty();

  @override
  Stream<WalletState> transformEvents(
    Stream<WalletEvent> events,
    Stream<WalletState> Function(WalletEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<WalletEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is WalletLoad) {
      yield* _mapWalletsLoadToState();
    }
  }

  Stream<WalletState> _mapWalletsLoadToState() async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        yield state.loaedSuccess();
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield WalletState.failure();
      }
    }
  }
}
