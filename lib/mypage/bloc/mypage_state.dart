import 'package:meta/meta.dart';

@immutable
class MyPageState {
  final bool isLoaded;

  MyPageState({
    @required this.isLoaded,
  });

  factory MyPageState.empty() {
    return MyPageState(
      isLoaded: true,
    );
  }
}
