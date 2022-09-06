import 'package:flutter/foundation.dart';

class RegisterProvider extends ChangeNotifier {
   bool _isObsured = true;
  bool get isObsured => _isObsured;

  void showPassword() {
    _isObsured = !isObsured;
    notifyListeners();
  }
}