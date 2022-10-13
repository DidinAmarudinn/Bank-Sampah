import 'package:bank_sampah/feature/profile/model/others_info_model.dart';
import 'package:bank_sampah/feature/profile/model/update_data_request.dart';
import 'package:bank_sampah/feature/profile/service/profile_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  String _message = "";

  ProfileProvider(this.helper);
  String get message => _message;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;
  final PreferencesHelper helper;
  final ProfileService service = ProfileService();

  OthersInfoModel? _othersInfoModel;
  OthersInfoModel? get othersInfoModel => _othersInfoModel;

  Future<void> updateProfile(UpdateDataRequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    final idNasabah = await helper.getId() ?? 0;
    final result = await service.updateProfile(request, idNasabah.toString());
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> getOthersInfo() async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getOthersInfo();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _othersInfoModel = data?.data;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
