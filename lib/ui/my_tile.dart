import 'package:sleep_music/repositories/my_tile_data.dart';
import 'package:flutter/widgets.dart';

class MyTile extends StatelessWidget {
  final MyTileData data;   // получаем параметры для отображения плитки

  const MyTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 177,
      width: 174.37,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _myContainer(data.assetName),
          _mySizedBox(data.title),
        ],
      ),
    );
  }

  Container _myContainer(String assetName) => Container(
    child: Image(
      image: AssetImage('assets/$assetName'), // внииательнее с assets/
      // конкатенация 'выражение' + 'выражение'
      // интерполяции ${выражение}
      // интерполяция чище и быстрее
      height: 122.93,
      width: 177,
    ),
    margin: const EdgeInsets.only(bottom: 11.37),
  );

  SizedBox _mySizedBox(String mText) => SizedBox(
    height: 40.07,
    width: 131.32,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Text>[
        Text(mText, style: _myTextStyleTitle),
        Text('45 MIN - SLEEP MUSIC', style: _myTextStyleClarification),
      ],
    ),
  );

  final TextStyle _myTextStyleClarification = const TextStyle(
    fontSize: 11,
    fontFamily: 'HelveticaNeueCyr',
    fontWeight: FontWeight.normal,
    color: Color(0xFF98A1BD),
  );

  final TextStyle _myTextStyleTitle = const TextStyle(
    fontSize: 18,
    fontFamily: 'HelveticaNeueCyr',
    fontWeight: FontWeight.bold,
    color: Color(0xFFE6E7F2),
  );
}