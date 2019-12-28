import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';

import 'bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AuthenticationBloc _authenticationBloc;

  SearchBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  SearchState get initialState => SearchState.empty();

  @override
  Stream<SearchState> transformEvents(
    Stream<SearchEvent> events,
    Stream<SearchState> Function(SearchEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<SearchEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchInit) {
      yield* _mapSearchInitToState();
    } else if (event is SearchHashtagLoad) {
      yield* _mapSearchHashtagLoadToState(event.searchValue, event.status);
    }else if (event is SearchLoad) {
      yield* _mapSearchLoadToState(event.searchValue, event.status);
    }
  }

  Stream<SearchState> _mapSearchInitToState() async* {
    print("]-----] _mapSearchInitToState [-----[ call");
    yield SearchState.empty();
  }

  Stream<SearchState> _mapSearchsLoadToState() async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        yield state.loaedSuccess();
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield SearchState.failure();
      }
    }
  }

  Stream<SearchState> _mapSearchHashtagLoadToState(
    String searchValue,
    int status,
  ) async* {
    try {
      yield state.loaedHashtag(searchValue);
    } catch (error) {
      print("]-----] error [-----[ ${error}");
      yield SearchState.failure();
    }
  }

  Stream<SearchState> _mapSearchLoadToState(
      String searchValue,
      int status,
      ) async* {
    try {
      yield state.loaed(searchValue);
    } catch (error) {
      print("]-----] error [-----[ ${error}");
      yield SearchState.failure();
    }
  }
}
