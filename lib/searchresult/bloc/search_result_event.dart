import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

class SearchResultLoad extends SearchResultEvent {
  final String searchValue;

  const SearchResultLoad({
    @required this.searchValue,
  });

  @override
  String toString() => 'SearchResultLoad';
}
