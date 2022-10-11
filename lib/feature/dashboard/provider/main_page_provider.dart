import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/material.dart';

class MainPageProvider extends ChangeNotifier {
  int _tabIndex = 0;

  MainPageProvider(this.helper);
  int get tabIndex => _tabIndex;

  bool _isBsu = false;
  bool get isBsu => _isBsu;

  final PreferencesHelper helper;

  void changeTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  Future<void> getIsBsu()async {
    String? level = await helper.getLevel();
    _isBsu = level == "Bank Sampah Unit";
    notifyListeners();
  }

}
