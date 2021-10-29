import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sleep_music/data_repository.dart';
import 'package:sleep_music/my_tile_data.dart';

class MyHomePageProvider extends ChangeNotifier {
  List<MyTileData>? _dataList;
  bool isEnableRefresh = false;
  bool isError = false;
  Object? error;

  List<MyTileData>? get dataList {
    return _dataList;
  }

  Future<List<MyTileData>?> loadDataList() async {
    try {
      _dataList = await DataRepository.getListData();
      isError = false;
    } catch (e) {
      error = e;
      isError = true;
    } finally {
      isEnableRefresh = true;
      notifyListeners();
    }
  }

  void onRefreshTap() {
    if (isEnableRefresh) {
      isError = false;
      _dataList = null;
      // делаем кнопку неактивной во время выполнения функции
      isEnableRefresh = false;
      notifyListeners();
      loadDataList();
    }
  }
}
