import 'package:flutter/foundation.dart';

class OjekProvider extends ChangeNotifier {
   List<String> _selectedDays = [];
  List<String> get selectedDays => _selectedDays;

  void selectDays(String day) {
    _selectedDays.add(day);
    notifyListeners();
  }

  void selectDay(String day) {
    _selectedDays.clear();
    _selectedDays.add(day);
    notifyListeners();
  }

  void removeDays(String day) {
    _selectedDays.removeWhere((e) => e == day);
    notifyListeners();
  }
  void clearData() {
    _selectedDays = [];
  }

  bool isChecked(String day) {
    bool isCheck = _selectedDays.where((e) => e == day).toList().isNotEmpty;
    return isCheck;
  }
}
