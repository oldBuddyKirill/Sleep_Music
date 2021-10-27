import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_music/my_bottom_provider.dart';

// ignore: must_be_immutable
class MyBottom extends StatelessWidget {
  const MyBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // возвращаем потребителя
    // Потребитель ищет виджет-предок Provider и получает его модель.
    // Затем он использует эту модель для создания виджетов и запускает
    // перестройку, если модель обновляется.
    return Consumer<MyBottomProvider>(
      builder: (context, bottomProvider, child) => BottomNavigationBar(
        items: _myBottomItems,
        currentIndex: bottomProvider.currentIndex,
        onTap: (index) => bottomProvider.currentIndex = index,
        elevation: 8,
        unselectedItemColor: const Color(0xFF98A1BD),
        selectedItemColor: const Color(0xFFE6E7F2),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: _myTextStyleBottom,
        unselectedLabelStyle: _myTextStyleBottom,
        backgroundColor: const Color(0xFF03174D),
        // фиксируем расстояние между элементами
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  final TextStyle _myTextStyleBottom = const TextStyle(
    fontSize: 14,
    fontFamily: 'HelveticaNeueCyr',
    fontWeight: FontWeight.normal,
  );

  Container _myActiveIcon({
    required double h,
    required double w,
    required String assetName,
  }) =>
      Container(
        height: 46,
        width: 46,
        alignment: Alignment.center,
        child: Image(
          image: AssetImage(assetName),
          height: h,
          width: w,
          color: const Color(0xFFE6E7F2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xFF8E97FD),
        ),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      );

  Container _myInactiveIcon({
    required double h,
    required double w,
    required String assetName,
  }) =>
      Container(
        child: Image(
          image: AssetImage(assetName),
          height: h,
          width: w,
        ),
        alignment: Alignment.center,
        height: 46,
        width: 46,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      );

  List<BottomNavigationBarItem> get _myBottomItems => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: _myActiveIcon(
            h: 22,
            w: 21.52,
            assetName: 'assets/Home.png',
          ),
          icon: _myInactiveIcon(
            h: 22,
            w: 21.52,
            assetName: 'assets/Home.png',
          ),
          label: 'Home',
        ), // home
        BottomNavigationBarItem(
          activeIcon: _myActiveIcon(
            h: 22,
            w: 22.8,
            assetName: 'assets/Moon.png',
          ),
          icon: _myInactiveIcon(
            h: 22,
            w: 22.8,
            assetName: 'assets/Moon.png',
          ),
          label: 'Sleep',
        ), // moon
        BottomNavigationBarItem(
          activeIcon: _myActiveIcon(
            h: 22,
            w: 18,
            assetName: 'assets/Drops.png',
          ),
          icon: _myInactiveIcon(
            h: 22,
            w: 18,
            assetName: 'assets/Drops.png',
          ),
          label: 'Meditate',
        ), // drops
        BottomNavigationBarItem(
          activeIcon: _myActiveIcon(
            h: 22,
            w: 25.85,
            assetName: 'assets/Music.png',
          ),
          icon: _myInactiveIcon(
            h: 22,
            w: 25.85,
            assetName: 'assets/Music.png',
          ),
          label: 'Music',
        ), // music
        BottomNavigationBarItem(
          activeIcon: _myActiveIcon(
            h: 23,
            w: 19.46,
            assetName: 'assets/User.png',
          ),
          icon: _myInactiveIcon(
            h: 23,
            w: 19.46,
            assetName: 'assets/User.png',
          ),
          label: 'User',
        ), // user
      ];
}
