import 'package:bank_sampah/feature/login/model/login_model.dart';
import 'package:bank_sampah/feature/login/service/login_service.dart';
import 'package:bank_sampah/feature/nasabah/service/nasabah_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObsured = true;

  final PreferencesHelper preferencesHelper;
  LoginProvider({required this.preferencesHelper});
  bool get isObsured => _isObsured;
  final LoginService service = LoginService();
  final NasabahService nasabahService = NasabahService();
  bool _checkIsUserHasCompletedProfile = false;
  bool get checkIsUserHasCompletedProfile => _checkIsUserHasCompletedProfile;
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "Silahkan Masukan Username dan Password Anda";
  String get message => _message;

  LoginModel? _loginModel;
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
    }, (result)  async {
      _loginModel = result?.data;
      
      notifyListeners();
    });
  }

  Future<void> checkNasabahData() async {
    int id = int.parse(_loginModel?.id ?? "0");
    final nasabahData = await nasabahService.getDataNsabah(id);
      nasabahData.fold((l) {
        _state = RequestState.error;
        _message = l.message;
        notifyListeners();
      }, (r) {
        preferencesHelper.setFullName(_loginModel?.namaUser ?? "");
        preferencesHelper.setId(id);
        preferencesHelper.setUsername(_loginModel?.username ?? "");
        preferencesHelper
            .setImageProfileUrl(_loginModel?.filefotoprofile ?? "");
        _state = RequestState.loaded;
        _checkIsUserHasCompletedProfile = r != null;
        notifyListeners();
      });
  }
}
