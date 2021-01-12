import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nyt_client_bloc_moor/presentation/bloc/nyt_homepage_event.dart';
import 'package:nyt_client_bloc_moor/presentation/bloc/nyt_homepage_state.dart';
import 'package:nyt_client_bloc_moor/use_cases/delete_all_data_in_db.dart';
import 'package:nyt_client_bloc_moor/use_cases/load_data_from_db.dart';
import 'package:nyt_client_bloc_moor/use_cases/load_data_from_nyt.dart';
import 'package:nyt_client_bloc_moor/use_cases/load_data_from_nyt_to_moor.dart';
import 'dart:async';

class NYTHomePageBloc extends Bloc<NYTLoadHomePageEvent, NYTLoadHomePageState> {
  final LoadNYTMainPageFromDB loadNYTMainPageFromDB;
  final LoadDataFromNYT dataFromNYT;
  final LoadDataFromNYTToMoor dataFromNYTToMoor;
  final DeleteAllDataInDB deleteAllDataInDB;

  NYTHomePageBloc(
      {@required this.dataFromNYTToMoor,
      this.dataFromNYT,
      this.loadNYTMainPageFromDB,
      this.deleteAllDataInDB});

  @override
  void onTransition(
      Transition<NYTLoadHomePageEvent, NYTLoadHomePageState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  NYTLoadHomePageState get initialState => NYTLoadHomePageStateLoading();

  @override
  Stream<NYTLoadHomePageState> mapEventToState(
      NYTLoadHomePageEvent event) async* {
    if (event is LoadNYTMainPage) {
      await deleteAllDataInDB.deleteAllDataInDB();
      yield NYTLoadHomePageStateLoading();
      try {
        final resultsListFromNYT = await dataFromNYT.loadData();
        await dataFromNYTToMoor.sendDataToMoor(resultsListFromNYT);
        final resultsListFromDB = await loadNYTMainPageFromDB.mainPageList;
        yield NYTLoadHomePageStateSuccess(resultsListFromDB);
      } catch (error) {
        yield NYTLoadHomePageStateError('something went wrong');
      }
    }
    if (event is UpdateNYTMainPage) {
      yield NYTLoadHomePageStateLoading();
      await deleteAllDataInDB.deleteAllDataInDB();
      try {
        await deleteAllDataInDB.deleteAllDataInDB();
        final resultsListFromNYT = await dataFromNYT.loadData();
        await dataFromNYTToMoor.sendDataToMoor(resultsListFromNYT);
        final resultsListFromDB = await loadNYTMainPageFromDB.mainPageList;
        yield NYTLoadHomePageStateSuccess(resultsListFromDB);
      } catch (error) {
        yield NYTLoadHomePageStateError('something went wrong');
      }
    }
  }
}
