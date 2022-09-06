import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeSliderIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}