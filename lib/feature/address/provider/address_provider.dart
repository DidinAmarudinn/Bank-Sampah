import 'package:bank_sampah/feature/address/model/add_address_request.dart';
import 'package:bank_sampah/feature/address/model/user_address_model.dart';
import 'package:bank_sampah/feature/address/service/address_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/request_state_enum.dart';

class AddressProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  AddressProvider(this.helper);
  int get selectedIndex => _selectedIndex;

  String _message = "";
  String get message => _message;

  final AddressService service = AddressService();
  final PreferencesHelper helper;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<UserAddressModel> _listUserAddress = [];
  List<UserAddressModel> get listUserAddress => _listUserAddress;

  void selectAddress(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> getUserAddress() async {
    _state = RequestState.loading;
    notifyListeners();
    final nasabahId = await helper.getId() ?? 0;
    final result = await service.getListUserAddress(nasabahId.toString());
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (r) {
      _listUserAddress = r?.data ?? [];
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> addAddressNasabah(AddAddressRequest addAddressRequest) async {
    _state = RequestState.loading;
    notifyListeners();
    final nasabahId = await helper.getId() ?? 0;
    final result = await service.addNasabahAddress(
        addAddressRequest, nasabahId.toString());
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (r) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
