import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchHashtagLoad extends SearchEvent {
  final String searchValue;
  final int status;

  const SearchHashtagLoad({
    @required this.searchValue,
    @required this.status,
  });

  @override
  List<Object> get props => [searchValue, status];

  @override
  String toString() => 'SearchHashtagLoad';
}

class SearchInit extends SearchEvent {
  @override
  String toString() => 'SearchInit';
}

class SearchLoad extends SearchEvent {
  final String searchValue;
  final int status;

  const SearchLoad({
    @required this.searchValue,
    @required this.status,
  });

  @override
  List<Object> get props => [searchValue, status];

  @override
  String toString() => 'SearchHashtagLoad';
}
