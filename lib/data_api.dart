import 'dart:async';
import 'dart:math';

class DataApi {
  // TODO to Stream
   static Future getData() async { // создаём асинхронную функцию getData()
    // мы явно не указываем тип возвращаемого значения
    // можно было бы написать так: static Future <String> getData() async
    await Future.delayed(const Duration(seconds: 3));
    // await работает только в пределах асинхронной функции
    // указываем время ожидания функции - 3 секунды
    // пока идут эти 3 секунды, другие ункции будут выполняться
    final int random = Random().nextInt(10); 
    
    // генерируем рандомное число в промежутке [0; 9]
    if (random > 8) throw 'Error';           // если число больше 8, генерируем исключение Error

    // возврщаем массив объектов json
    return '''
    [
      {
      "assetName":"NightIsland.png",
      "title":"Night Island"
      },
      {
      "assetName":"SweetSleep.png",
      "title":"Sweet Sleep"
      },
      {
      "assetName":"GoodNight.png",
      "title":"Good Night"
      },
      {
      "assetName":"MoonClouds.png",
      "title":"Moon Clouds"
      },
      {
      "assetName":"SweetSleep.png",
      "title":"Sweet Sleep"
      },
      {
      "assetName":"NightIsland.png",
      "title":"Night Island"
      },
      {
      "assetName":"MoonClouds.png",
      "title":"Moon Clouds"
      },
      {
      "assetName":"GoodNight.png",
      "title":"Good Night"
      }
    ]  
    ''';
  }
}
