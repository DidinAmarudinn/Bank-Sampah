import 'package:bank_sampah/feature/withdraw/pdam/model/pasca.dart';
import 'package:bank_sampah/feature/withdraw/pdam/model/wilayah_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/preference_helper.dart';
import '../../../../utils/request_state_enum.dart';
import '../../model/ppob_request.dart';
import '../../service/withdraw_service.dart';
import '../model/pdam_bill_check_model.dart';

class PDAMProvider extends ChangeNotifier {
  String _point = "0";

  PDAMProvider(this.helper);
  String get point => _point;
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  final WithdrawService service = WithdrawService();
  final PreferencesHelper helper;

  WilayahModel? _wilayahModel;
  WilayahModel? get wilayahModel => _wilayahModel;

  Future<void> getWilayahPDAM() async {
    _point = await helper.getPoint() ?? "0";
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getWilayahModel();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _wilayahModel = data;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Pasca? _selectedPasca;
  Pasca? get selectedPasca => _selectedPasca;

  void selectPasca(Pasca? pasca) {
    _selectedPasca = pasca;
    notifyListeners();
  }

  bool _isSufficientBalance = true;
  bool get isSufficientBalance => _isSufficientBalance;
  PdamBillCheckModel? _billCheckModel;
  PdamBillCheckModel? get billCheckModel => _billCheckModel;

  Future<void> billCheck(String customerId) async {
    _point = await helper.getPoint() ?? "0";
    _state = RequestState.loading;
    notifyListeners();
    final result =
        await service.getUserBillCheck(customerId, _selectedPasca?.code ?? "");

    _billCheckModel = null;
    result.fold((failure) {
      _message = failure.message;
      _billCheckModel = null;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _billCheckModel = data;
      _isSufficientBalance = (data?.price ?? 0) <=
          int.parse(_point.trim().replaceAll("Rp", "").replaceAll(".", ""));
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  RequestState _btnState = RequestState.empty;
  RequestState get btnState => _btnState;

  Future<void> checkout(PPOBRequest request) async {
    _btnState = RequestState.loading;
    notifyListeners();
    int idUser = await helper.getId() ?? 0;
    String idBsu = await helper.getIdBsu() ?? "";
    String idNasabah = await helper.getIdNasabah() ?? "";
    final result = await service.checkout(
        request, idUser.toString(), idNasabah, idBsu,
        billCheckModel: _billCheckModel);
    result.fold((failure) {
      _message = failure.message;
      _btnState = RequestState.error;
      notifyListeners();
    }, (r) {
      _btnState = RequestState.loaded;
      _billCheckModel = null;
      notifyListeners();
    });
  }
}
