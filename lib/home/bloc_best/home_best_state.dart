import 'package:meta/meta.dart';
import 'package:with_flutter/model/member.dart';

@immutable
class HomeBestState {
  final bool isLoaded;
  final List<Member> members;

  HomeBestState({
    @required this.isLoaded,
    @required this.members,
  });

  factory HomeBestState.empty() {
    return HomeBestState(
      isLoaded: false,
      members: null,
    );
  }

  factory HomeBestState.loading() {
    return HomeBestState(
      isLoaded: false,
      members: null,
    );
  }

  factory HomeBestState.failure() {
    return HomeBestState(
      isLoaded: false,
      members: null,
    );
  }

  factory HomeBestState.loaedSuccess(List<Member> members) {
    return HomeBestState(
      isLoaded: true,
      members: members,
    );
  }

  HomeBestState copyWith({
    bool isLoaded,
    List<Member> members,
  }) {
    return HomeBestState(
      isLoaded: isLoaded ?? this.isLoaded,
      members: members ?? this.members,
    );
  }
}
