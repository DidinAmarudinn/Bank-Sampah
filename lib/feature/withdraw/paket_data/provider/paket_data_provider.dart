import 'package:flutter/foundation.dart';

import '../../../../utils/preference_helper.dart';
import '../../../../utils/request_state_enum.dart';
import '../../model/ppob_request.dart';
import '../../pulsa/model/datum.dart';
import '../../service/withdraw_service.dart';

class PaketDataProvider extends ChangeNotifier {
  List<Datum> _list = [];

  PaketDataProvider(this.helper);
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

  String _point = "0";
  String get point => _point;
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  bool _isSufficientBalance = true;
  bool get isSufficientBalance => _isSufficientBalance;

  Future<void> getPriceListData() async {
    _point = await helper.getPoint() ?? "0";
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getPriceData();
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
    final result =
        await service.checkout(request, idUser.toString(), idNasabah, idBsu);
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
