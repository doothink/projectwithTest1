import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';

@immutable
class WalletState {
  final bool isLoaded;
  final bool isLoading;

  WalletState({
    @required this.isLoaded,
    @required this.isLoading,
  });

  factory WalletState.empty() {
    return WalletState(
      isLoaded: false,
      isLoading: false,
    );
  }

  factory WalletState.failure() {
    return WalletState(
      isLoaded: false,
      isLoading: false,
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

  WalletState loaedSuccess() {
    return copyWith(
      isLoaded: true,
      isLoading: false,
    );
  }

  WalletState copyWith({
    bool isLoaded,
    bool isLoading,
    Feed feed,
  }) {
    return WalletState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
