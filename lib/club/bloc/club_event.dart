import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ClubEvent extends Equatable {
  const ClubEvent();

  @override
  List<Object> get props => [];
}

class ClubLoad extends ClubEvent {
  final int clubId;

  const ClubLoad({
    @required this.clubId,
  });

  @override
  List<Object> get props => [clubId];

  @override
  String toString() => 'ClubLoad { clubId: $clubId}';
}
