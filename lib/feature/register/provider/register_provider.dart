import 'package:bank_sampah/feature/register/service/register_service.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/request_state_enum.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isObsured = true;
  bool get isObsured => _isObsured;
  RegisterService service = RegisterService();

  RequestState _state = RequestState.empty;
  RequestState get state => _state;
  String _idGroup = "";
  String _message = "Silahkan isi semua field di atas";
  String get message => _message;
  void showPassword() {
    _isObsured = !isObsured;
    notifyListeners();
  }

  Future<void> register(String email, String password, String name,
      String username, String noTelp) async {
    _state = RequestState.loading;
    notifyListeners();
    await getGroupId();
    final result = await service.register(
        username, password, name, email, noTelp, _idGroup);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> getGroupId() async {
    final result = await service.getGroupId();
    if (result != null) {
      _idGroup = result.result?[0].id ?? "";
    }
  }
}
