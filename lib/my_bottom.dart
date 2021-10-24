import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBottom extends StatelessWidget {
  final Function(int) onTapped;
  int selectedIndex;

  MyBottom({
    Key? key,
    required this.onTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: _myBottomItems,
        currentIndex: selectedIndex,
        onTap: onTapped,
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
