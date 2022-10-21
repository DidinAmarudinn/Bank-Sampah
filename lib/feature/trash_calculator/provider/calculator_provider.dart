import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/feature/trash_calculator/service/calculator_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class CalculatorProvider extends ChangeNotifier {
  RequestState _state = RequestState.empty;

  CalculatorProvider(this.helper);
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  List<TrashModel> _list = [];

  List<TrashModel> _searchResult = [];
  List<TrashModel> get searchResult => _searchResult;
  final PreferencesHelper helper;
  bool _isBsu = false;
  bool get isBsu => _isBsu;
  final CalculatorService service = CalculatorService();

  Future<void> getTrashList() async {
    _state = RequestState.loading;
    notifyListeners();
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    final result = await service.getListTrash();
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      _list = data?.data ?? [];
      _searchResult = _list;
      notifyListeners();
    });
  }

  Future<void> searchTrash(String query) async {
    _searchResult = _list.where((element) {
      return element.jenisSampah?.trim().toLowerCase().contains(query) ?? true;
    }).toList();
    if (query.isNotEmpty) {
      _searchResult = _searchResult;
      notifyListeners();
    } else {
      _searchResult = _list;
      notifyListeners();
    }
  }
}
