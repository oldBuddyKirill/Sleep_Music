import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sleep_music/repositories/data_repository.dart';
import 'package:sleep_music/repositories/my_tile_data.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  List<MyTileData>? _dataList;

  HomePageBloc() : super(HomePageInitial()) {
    on<OnRefreshTap>(loadDataList);
    on<StartedApplication>(loadDataList);
  }

  FutureOr<void> loadDataList(HomePageEvent event, Emitter<HomePageState> emit) async {
    if (state is! HomePageLoading){
      try {
        emit(HomePageLoading());
        _dataList = await DataRepository.getListData();
        return emit(HomePageShowData(_dataList!));
      } catch (e) {
        return emit(HomePageError(e));
      }
    }
  }
}
