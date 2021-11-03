class MyTileData {
  final String assetName;
  final String title;

  const MyTileData({
    required this.assetName,
    required this.title,
  });

  factory MyTileData.fromJson(Map<String, dynamic> json) {
    // конструктор factory более универсальный
    return MyTileData(
      // инициализируем свойство assetName класса MyTileData значением объекта json под ключом assetName
      assetName: json['assetName'],
      // инициализируем свойство (поле) title класса MyTileData значением объекта json под ключом title
      title: json['title'],
    );
  }

  /* можно использовать аналогиичный конструктор
  MyTileData.fromJson(Map<String, dynamic> json)
      : assetName = json['assetName'],
      title = json['title'],
   */

  static List<MyTileData> fromJsonArray(dynamic jsonArray) {
    // функция, возвращающая статический масскив объектов MyTileData
    // входной параметр - ЛЮБОЙ тип данных, в нашем случае это - массив объектов json
    List<MyTileData> result = []; // создаём пустой массив для объектов класса MyTileData
    for (var it in jsonArray) {
      // проверяем каждую переменную в json массиве
      if (it['assetName'] is String && it['title'] is String) {
        // если значения объекта json под ключами assetName и title являются строками
        result.add(MyTileData.fromJson(it)); // добавляем этот объект в наш массив
      }
    }
    return result; // возвращем массив с данными
  }
}
