import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sleep_music/data_repository.dart';
import 'package:sleep_music/my_tile_data.dart';


class MyHomePageProvider extends ChangeNotifier {
  Future<List<MyTileData>?> get dataList async {
    await DataRepository.getListData();
    notifyListeners();
  }
}
