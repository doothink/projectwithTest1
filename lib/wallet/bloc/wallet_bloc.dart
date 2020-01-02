import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/account.dart';

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
    print("]-----] isLoading [-----[ ${state.isLoading}");
    if (!state.isLoading) {
      print("]-----] isLoading 1[-----[ ${state.isLoading}");
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc.get('/api/account');
        print("]-----] response 1[-----[ ${response}");
        if (response != null) {
          final account = Account.fromJson(response);
          print("]-----] account 1[-----[ ${account}");
          yield state.loaedSuccess(account: account);
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield WalletState.failure();
      }
    }
  }
}
