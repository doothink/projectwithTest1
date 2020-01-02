import 'package:meta/meta.dart';
import 'package:with_flutter/model/account.dart';

@immutable
class WalletState {
  final bool isLoaded;
  final bool isLoading;
  final Account account;

  WalletState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.account,
  });

  factory WalletState.empty() {
    return WalletState(
      isLoaded: false,
      isLoading: false,
      account: null,
    );
  }

  factory WalletState.failure() {
    return WalletState(
      isLoaded: false,
      isLoading: false,
      account: null,
    );
  }

  WalletState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  WalletState loaedSuccess({Account account}) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      account: account,
    );
  }

  WalletState copyWith({
    bool isLoaded,
    bool isLoading,
    Account account,
  }) {
    return WalletState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account,
    );
  }
}
