import 'package:bank_sampah/feature/nasabah/model/complete_profile_request.dart';
import 'package:bank_sampah/feature/nasabah/model/district_model.dart';
import 'package:bank_sampah/feature/nasabah/model/vilage_model.dart';
import 'package:bank_sampah/feature/nasabah/service/nasabah_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/request_state_enum.dart';
import '../model/nasabah_category_model.dart';

class NasabahProvider extends ChangeNotifier {
  final NasabahService service = NasabahService();

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<DistrictModel> _districts = [];
  List<DistrictModel> get districts => _districts;
  List<VilageModel> _vilages = [];
  List<VilageModel> get vilages => _vilages;
  List<NasabahCategoryModel> _nasabahCategories = [];
  List<NasabahCategoryModel> get nasabahCategories => _nasabahCategories;

  DistrictModel? _selectedDistrict;
  DistrictModel? get selectedDistrict => _selectedDistrict;

  VilageModel? _selectedVilage;
  VilageModel? get selectedVilage => _selectedVilage;

  NasabahCategoryModel? _selectedNasabahType;
  NasabahCategoryModel? get selectedNasabahType => _selectedNasabahType;

  bool _isAddToAddressBook = false;
  bool get isAddToAddressBook => _isAddToAddressBook;

  String _message = "";
  String get message => _message;

  String _messageVilage = "";
  String get messageVilage => _messageVilage;

  String _messageCompleteProfile = "Lengkapi filed di atas";
  String get messageCompleteProfile => _messageCompleteProfile;

  String _messageNasabahType = "";
  String get messageNasabahType => _messageNasabahType;
  Future<void> completeProfile(CompleteProfileRequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.postCompleteProfile(request);
    result.fold((failure) {
      _state = RequestState.error;
      _messageCompleteProfile = failure.message;
      notifyListeners();
    }, (success) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<List<DistrictModel>> updateListDistricts(String param) async {
    final result = await service.getDistrict(param);
    result.fold((failure) {
      _message = failure.message;
      notifyListeners();
    }, (result) {
      if (result?.data != null) {
        _districts = result!.data!;
      }
    });
    return _districts;
  }

  Future<void> getVilagesData() async {
    if (_selectedDistrict != null) {
      String cityName = _selectedDistrict?.cityName ?? "";
      String districtName = _selectedDistrict?.districtName ?? "";
      final result = await service.getVilages(districtName, cityName);
      result.fold((failure) {
        _messageVilage = failure.message;
        notifyListeners();
      }, (result) {
        if (result?.data != null) {
          _vilages = result!.data!;
          notifyListeners();
        }
      });
    }
  }

  Future<void> getNasabahCategory() async {
    final result = await service.getNasabahCategory();
    result.fold((failure) {
      _messageNasabahType = failure.message;
      notifyListeners();
    }, (result) {
      if (result?.data != null) {
        _nasabahCategories = result?.data ?? [];
        notifyListeners();
      }
    });
  }

  void selectDistrict(DistrictModel? districtModel) {
    _selectedDistrict = districtModel;
    selectVilage(null);
    notifyListeners();
  }

  void selectNasabahType(NasabahCategoryModel? nasabahCategoryModel) {
    _selectedNasabahType = nasabahCategoryModel;
    notifyListeners();
  }

  void selectVilage(VilageModel? vilageModel) {
    _selectedVilage = vilageModel;
    notifyListeners();
  }

  void changeIsAddToAddressBook(bool newVal) {
    _isAddToAddressBook = newVal;
    notifyListeners();
  }
}
