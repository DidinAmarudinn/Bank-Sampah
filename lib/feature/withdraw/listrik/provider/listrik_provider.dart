import 'package:bank_sampah/feature/withdraw/model/pln_subscriber_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/preference_helper.dart';
import '../../../../utils/request_state_enum.dart';
import '../../model/ppob_request.dart';
import '../../pulsa/model/datum.dart';
import '../../service/withdraw_service.dart';

class ListrikProvider extends ChangeNotifier {
  List<Datum> _list = [];

  ListrikProvider(this.helper);
  List<Datum> get list => _list;

  final WithdrawService service = WithdrawService();
  Datum? _selectToken;
  Datum? get selectToken => _selectToken;
  bool _isSufficientBalance = true;
  bool get isSufficientBalance => _isSufficientBalance;
  void selectNominal(Datum tokenModel) {
    _selectToken = tokenModel;
    _isSufficientBalance = (_selectToken?.pulsaPrice ?? 0) <=
        int.parse(_point.trim().replaceAll("Rp", "").replaceAll(".", ""));
    notifyListeners();
  }

  final PreferencesHelper helper;

  String _point = "0";
  String get point => _point;
  RequestState _state = RequestState.empty;
  RequestState get state => _state;
  RequestState _btnState = RequestState.empty;
  RequestState get btnState => _btnState;

  String _message = "";
  String get message => _message;

  Future<void> getPriceListToken() async {
    _point = await helper.getPoint() ?? "";
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getPriceListToken();
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

  PlnSubscriberModel? _plnSubscriberModel;
  PlnSubscriberModel? get plnSubscriberModel => _plnSubscriberModel;

  Future<void> getSubscriberData(String customerId) async {
    _btnState = RequestState.loading;
    notifyListeners();
    final result = await service.getUserSubscriberData(customerId);
    result.fold((failure) {
      _message = failure.message;
      _btnState = RequestState.error;
      notifyListeners();
    }, (data) {
      _plnSubscriberModel = data;
      _btnState = RequestState.loaded;
      notifyListeners();
    });
  }

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
