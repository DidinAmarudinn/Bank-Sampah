import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';

import '../../dashboard/model/slider_model.dart';

class ActivityProvider extends ChangeNotifier {
  DashboardService service = DashboardService();

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<SliderModel?>? _listSlider = [];
  List<SliderModel?>? get listSlider => _listSlider;

  Future<void> getListSlider() async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getSlider("Kegiatan");
    result.fold((error) {
      _state = RequestState.error;
      _errorMessage = error.message;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      _listSlider = data.data;
      notifyListeners();
    });
  }
}
