import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class WalletLoad extends WalletEvent {
  @override
  String toString() => 'WalletLoad';
}
