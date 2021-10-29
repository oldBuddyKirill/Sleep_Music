import 'dart:convert';

import 'package:sleep_music/data_api.dart';
import 'package:sleep_music/my_tile_data.dart';

class DataRepository {
  static Future <List<MyTileData>?> getListData() async{ // создаём ассинхронную функцию getListData()
    final data = await DataApi.getData();             // инициализируем переменную data значением асинхронной функции
    final List<dynamic> _jsonArray = json.decode(data); // заполняем массив преобразованными объектами json
    // возвращаем массив объектов MyTile, созданный с помощью конструктора  MyTile.fromJsonArray
    return MyTileData.fromJsonArray(_jsonArray);
  }
}