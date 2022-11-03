import 'package:bank_sampah/feature/withdraw/model/ppob_request.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/model/datum.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:bank_sampah/feature/withdraw/service/withdraw_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class PulsaProvider extends ChangeNotifier {
  List<Datum> _list = [];

  PulsaProvider(this.helper);
  List<Datum> get list => _list;

  final WithdrawService service = WithdrawService();
  Datum? _selectedPulsaModel;
  Datum? get selectePulsaModel => _selectedPulsaModel;

  void selectNominal(Datum pulsaModel) {
    _selectedPulsaModel = pulsaModel;
    _isSufficientBalance = (_selectedPulsaModel?.pulsaPrice ?? 0) <=
        int.parse(_point.trim().replaceAll("Rp", "").replaceAll(".", ""));
    notifyListeners();
  }

  final PreferencesHelper helper;

  PaymentMethodModel? _selectedPaymentMethod;
  PaymentMethodModel? get selectedPaymentMethod => _selectedPaymentMethod;

  void selectPaymentMethod(PaymentMethodModel paymentMethodModel) {
    _selectedPaymentMethod = paymentMethodModel;
    notifyListeners();
  }

  String _point = "0";
  String get point => _point;
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  bool _isSufficientBalance = true;
  bool get isSufficientBalance => _isSufficientBalance;

  Future<void> getPriceListPulsa() async {
    _point = await helper.getPoint() ?? "0";
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getPriceListPulsa();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _list = data?.data ?? [];
      if (_list.isNotEmpty) {
        _list
            .sort((a, b) => (a.pulsaPrice ?? 0).compareTo((b.pulsaPrice ?? 0)));
      }
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
    final result = await service.checkout(request, idUser.toString(), idNasabah, idBsu);
    result.fold((failure) {
      _message = failure.message;
      _btnState = RequestState.error;
      notifyListeners();
    }, (r) {
      _btnState = RequestState.loaded;
      notifyListeners();
    });
  }
}
