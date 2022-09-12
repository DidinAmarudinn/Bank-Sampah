import 'package:bank_sampah/feature/login/model/login_model.dart';
import 'package:bank_sampah/feature/login/service/login_service.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObsured = true;
  bool get isObsured => _isObsured;
  final LoginService service = LoginService();

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "Silahkan masukan email dan password anda";
  String get message => _message;

  LoginModel? _loginModel = null;
  LoginModel? get loginModel => _loginModel;

  void showPassword() {
    _isObsured = !isObsured;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.login(username, password);
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (result) {
      _state = RequestState.loaded;
      _loginModel = result;
      notifyListeners();
    });
  }
}
