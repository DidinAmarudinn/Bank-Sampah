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
  RequestState _stateGetDataBSU = RequestState.empty;
  RequestState get stateGetDataBSU => _stateGetDataBSU;
  String _messageErrorBsu = "";
  String get messageErrorBsu => _messageErrorBsu;

  RequestState _stateChecDataNasabah = RequestState.empty;
  RequestState get stateChecDataNasabah => _stateChecDataNasabah;
  String _messageErrorNasabah = "";
  String get messageErrorNasabah => _messageErrorNasabah;

  String _message = "Silahkan Masukan Username dan Password Anda";
  String get message => _message;

  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;

  bool _isBsu = false;
  bool get isBsu => _isBsu;

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
    }, (result) async {
      _loginModel = result?.data;
      _state = RequestState.loaded;
      int id = int.parse(result?.data?.id ?? "0");
      print(_loginModel?.namaUser);
      print(_loginModel?.username);
      print(_loginModel?.level);
      preferencesHelper.setId(id);
      preferencesHelper.setLevel(result?.data?.level ?? "");
      preferencesHelper.setUsername(result?.data?.username ?? "");
      preferencesHelper.setFullName(result?.data?.namaUser ?? "");
      preferencesHelper.setImageProfileUrl(_loginModel?.filefotoprofile ?? "");
      _isBsu = _loginModel?.level == "Bank Sampah Unit";
      notifyListeners();
    });
  }

  Future<void> forgotPassword(String email) async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.forgotPassword(email);
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (result) async {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> checkNasabahData() async {
    _stateChecDataNasabah = RequestState.loading;
    int id = await preferencesHelper.getId() ?? 0;
    final nasabahData = await nasabahService.getDataNsabah(id);
    nasabahData.fold((l) {
      _stateChecDataNasabah = RequestState.error;
      _messageErrorNasabah = l.message;
      notifyListeners();
    }, (r) {
      _stateChecDataNasabah = RequestState.loaded;
      _checkIsUserHasCompletedProfile = r != null;
      print(r?.idKelurahan);

      if (_checkIsUserHasCompletedProfile) {
        preferencesHelper.setFullName(r?.namaNasabah ?? "");
        preferencesHelper.setEmail(r?.email ?? "");
        preferencesHelper.setPhoneNumber(r?.noKontak ?? "");
        preferencesHelper.setIdNasabah(r?.id ?? "0");
      }
      notifyListeners();
    });
  }

  Future<void> getDataBsu() async {
    _stateGetDataBSU = RequestState.loading;
    int? id = await preferencesHelper.getId();
    final bsuData = await service.getDataBsu(id.toString());
    bsuData.fold((failure) {
      _stateGetDataBSU = RequestState.error;
      _messageErrorBsu = failure.message;
      notifyListeners();
    }, (result) {
      if (result == null) {
        _stateGetDataBSU = RequestState.error;
        _messageErrorBsu = "Error Silahkan Coba Kembali";
      } else {
        preferencesHelper.setIdBsu(result.id ?? "0");
        preferencesHelper.setPhoneNumber(result.noKontak ?? "");
        _stateGetDataBSU = RequestState.loaded;
      }
      notifyListeners();
    });
  }
}
