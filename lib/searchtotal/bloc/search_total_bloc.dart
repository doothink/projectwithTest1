import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/authentication_bloc/authentication.dart';
import 'package:with_flutter/model/jobInfo.dart';
import 'package:with_flutter/model/models.dart';

import 'bloc.dart';

class SearchTotalBloc extends Bloc<SearchTotalEvent, SearchTotalState> {
  final AuthenticationBloc _authenticationBloc;

  SearchTotalBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  SearchTotalState get initialState => SearchTotalState.empty();

  @override
  Stream<SearchTotalState> transformEvents(
    Stream<SearchTotalEvent> events,
    Stream<SearchTotalState> Function(SearchTotalEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<SearchTotalEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<SearchTotalState> mapEventToState(SearchTotalEvent event) async* {
    print("]-----] mapEventToState [-----[ ${event}");
    if (event is SearchTotalLoad) {
      yield* _mapSearchTotalsLoadToState(event.searchValue);
    } else if (event is SearchTotalInit) {

      yield* _mapSearchTotalInitToState();
    }
  }

  Stream<SearchTotalState> _mapSearchTotalsLoadToState(
      String searchValue) async* {
//    print("]-----] searchValue [-----[ ${searchValue}");
    if (!state.isLoading) {
      yield state.updateLoading(isLoading: true);
      try {
        final response = await _authenticationBloc
            .get('/api/searchresult?searchValue=$searchValue');
//        print("]-----] response [-----[ ${response}");
        if (response != null) {
          List<JobInfo> jobInfos = [];
          if (response['jobInfos'] != null) {
            final jobContents = response['jobInfos']['content'] as List;
            jobInfos = jobContents.map((data) {
              return JobInfo.fromJson(data);
            }).toList();
          }

          List<Club> clubs = [];
          if (response['clubs'] != null) {
            final clubContents = response['clubs']['content'] as List;
            clubs = clubContents.map((data) {
              return Club.fromJson(data);
            }).toList();
          }

          List<Member> members = [];
          if (response['members'] != null) {
            final memberContents = response['members']['content'] as List;
            members = memberContents.map((data) {
              return Member.fromJson(data);
            }).toList();
          }

          yield state.loaedSuccess(
            jobInfos: jobInfos,
            clubs: clubs,
            members: members,
          );
        }
      } catch (error) {
        print("]-----] error [-----[ ${error}");
        yield SearchTotalState.failure();
      }
    }
  }

  Stream<SearchTotalState> _mapSearchTotalInitToState() async* {
    yield SearchTotalState.empty();
  }
}
