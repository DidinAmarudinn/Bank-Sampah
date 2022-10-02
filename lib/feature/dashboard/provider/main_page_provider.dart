import 'package:flutter/material.dart';

class MainPageProvider extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void changeTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}