import 'package:bank_sampah/feature/bsu/model/penagihan_model.dart';
import 'package:bank_sampah/feature/bsu/model/penimbangan_model.dart';
import 'package:bank_sampah/feature/bsu/service/bsu_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class BSUProvider extends ChangeNotifier {
 

  BSUProvider(this.helper);
   RequestState _state = RequestState.empty;
  RequestState get state => _state;
   RequestState _statePenimbangan = RequestState.empty;
  RequestState get statePenimbangan => _statePenimbangan;

  String _message = "";
  String get message => _message;

  final PreferencesHelper helper;

  List<PenagihanModel> _listPenagihan = [];
  List<PenagihanModel> get listPenagihan => _listPenagihan;

  BSUService service = BSUService();

  Future<void> getPenagihan() async {
    String idBsu = await helper.getIdBsu() ?? "";
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getPenagihan(idBsu);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _listPenagihan = data?.data ?? [];
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  List<PenimbanganModel> _listPenimbangan = [];
  List<PenimbanganModel> get listPenimbangan => _listPenimbangan;

  Future<void> getPenimbangan() async {
    String idBsu = await helper.getIdBsu() ?? "";
    _statePenimbangan = RequestState.loading;
    notifyListeners();
    final result = await service.getPenimbangan(idBsu);
    result.fold((failure) {
      _message = failure.message;
      _statePenimbangan = RequestState.error;
      notifyListeners();
    }, (data) {
      _listPenimbangan = data?.data ?? [];
      _statePenimbangan = RequestState.loaded;
      notifyListeners();
    });
  }
}
