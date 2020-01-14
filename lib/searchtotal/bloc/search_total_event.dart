import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchTotalEvent extends Equatable {
  const SearchTotalEvent();

  @override
  List<Object> get props => [];
}

class SearchTotalInit extends SearchTotalEvent {
  @override
  String toString() => 'SearchTotalInit';
}

class SearchTotalLoad extends SearchTotalEvent {
  final String searchValue;

  const SearchTotalLoad({
    @required this.searchValue,
  });

  @override
  String toString() => 'SearchTotalLoad';
}
