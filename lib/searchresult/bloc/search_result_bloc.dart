import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/jobInfo.dart';

import 'bloc.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final AuthenticationBloc _authenticationBloc;

  SearchResultBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  SearchResultState get initialState => SearchResultState.empty();

  @override
  Stream<SearchResultState> transformEvents(
    Stream<SearchResultEvent> events,
    Stream<SearchResultState> Function(SearchResultEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<SearchResultEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<SearchResultState> mapEventToState(SearchResultEvent event) async* {
    if (event is SearchResultLoad) {
      yield* _mapSearchResultsLoadToState(event.searchValue);
    }
  }

  Stream<SearchResultState> _mapSearchResultsLoadToState(
      String searchValue) async* {
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc
            .get('/api/searchresult/hashtags?searchValue=$searchValue');
        if (response != null) {
          final contents = response['content'] as List;
          final List<JobInfo> jobInfos = contents.map((data) {
            return JobInfo.fromJson(data);
          }).toList();
          yield state.loaedSuccess(jobInfos: jobInfos);
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield SearchResultState.failure();
      }
    }
  }
}
