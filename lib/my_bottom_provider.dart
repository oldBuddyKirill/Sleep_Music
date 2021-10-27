import 'package:flutter/foundation.dart';

class MyBottomProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    // Этот вызов сообщает виджетам, которые слушают эту модель, о необходимости перестроиться
    notifyListeners();
  }
}
