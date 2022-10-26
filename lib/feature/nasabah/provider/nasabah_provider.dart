import 'package:bank_sampah/feature/nasabah/model/add_nasabah_bsu_request.dart';
import 'package:bank_sampah/feature/nasabah/model/complete_profile_request.dart';
import 'package:bank_sampah/feature/nasabah/model/district_model.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_bsu_model.dart';
import 'package:bank_sampah/feature/nasabah/model/vilage_model.dart';
import 'package:bank_sampah/feature/nasabah/service/nasabah_service.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
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

  RequestState _stateListNasabah = RequestState.empty;
  RequestState get stateListNasabah => _stateListNasabah;

  List<NasabahBSUModel> _nasabahBsuList = [];
  List<NasabahBSUModel> get nasabaBsuList => _nasabahBsuList;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

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

  final PreferencesHelper helper;
  NasabahProvider({required this.helper});
  String _messageVilage = "";
  String get messageVilage => _messageVilage;

  String _messageCompleteProfile = "Lengkapi filed di atas";
  String get messageCompleteProfile => _messageCompleteProfile;

  String _messageNasabahType = "";
  String get messageNasabahType => _messageNasabahType;
  bool _isBsu = false;
  bool get isBsu => _isBsu;
  Future<void> completeProfile(CompleteProfileRequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    _isBsu = await helper.getLevel() == bsuCode;
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

  String _statusOjekSampah = "berlangganan";
  String get statusOjekSampah => _statusOjekSampah;

  void selectStatusOjekSampah(bool isBerlangganan) {
    if (isBerlangganan) {
      _statusOjekSampah = "berlangganan";
    } else {
      _statusOjekSampah = "tidak berlangganan";
    }
    notifyListeners();
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

  Future<void> getListNasabahBSU() async {
    _stateListNasabah = RequestState.loading;
    notifyListeners();
    final idBsu = await helper.getIdBsu();
    final result = await service.getListNasabahBSU(idBsu ?? "0");
    result.fold((failure) {
      _errorMessage = failure.message;
      _stateListNasabah = RequestState.error;
      notifyListeners();
    }, (result) {
      _nasabahBsuList = result?.data ?? [];
      _stateListNasabah = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> addNasabahBsu(AddNasabahBsuRequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.addNasabahBsu(request);
    result.fold((failure) {
      _state = RequestState.error;
      _messageCompleteProfile = failure.message;
      notifyListeners();
    }, (success) {
      _state = RequestState.loaded;
      notifyListeners();
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

  void clear() {
    _selectedDistrict = null;
    _selectedVilage = null;
    notifyListeners();
  }
}
