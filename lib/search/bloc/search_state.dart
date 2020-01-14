import 'package:meta/meta.dart';
import 'package:with_flutter/model/feed.dart';

@immutable
class SearchState {
  final bool isLoaded;
  final bool isLoading;
  final int status;
  final String searchValue;

  SearchState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.status,
    @required this.searchValue,
  });

  factory SearchState.empty() {
    return SearchState(
      isLoaded: false,
      isLoading: false,
      status: 0,
      searchValue: null,
    );
  }

  factory SearchState.failure() {
    return SearchState(
      isLoaded: false,
      isLoading: false,
      status: 0,
      searchValue: null,
    );
  }

  SearchState updateLoading({
    bool isLoading,
  }) {
    return copyWith(
      isLoaded: false,
      isLoading: isLoading,
    );
  }

  SearchState loaedSuccess() {
    return copyWith(
      isLoaded: true,
      isLoading: false,
    );
  }

  SearchState loaedHashtag(String searchValue) {
    return copyWith(
      isLoaded: false,
      isLoading: false,
      status: 1,
      searchValue: searchValue,
    );
  }

  SearchState loaed(String searchValue) {
    return copyWith(
      isLoaded: true,
      isLoading: false,
      status: 2,
      searchValue: searchValue,
    );
  }

  SearchState updateInit() {
    return copyWith(
      isLoaded: false,
      isLoading: false,
      status: 0,
      searchValue: "",
    );
  }

  SearchState copyWith({
    bool isLoaded,
    bool isLoading,
    int status,
    String searchValue,
  }) {
    return SearchState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      searchValue: searchValue ?? this.searchValue,
    );
  }
}
