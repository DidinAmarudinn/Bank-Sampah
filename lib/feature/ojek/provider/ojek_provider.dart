import 'package:bank_sampah/feature/ojek/model/gudang_model.dart';
import 'package:bank_sampah/feature/ojek/model/vilage_available_model.dart';
import 'package:bank_sampah/feature/ojek/service/ojek_service.dart';
import 'package:bank_sampah/feature/user_available_address/data_buku_alamat.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

import '../../user_available_address/data_jenis_nasabah.dart';

class OjekProvider extends ChangeNotifier {
  List<String> _selectedDays = [];

  OjekProvider(this.helper);
  List<String> get selectedDays => _selectedDays;

  final OjekService service = OjekService();

  void selectDays(String day) {
    _selectedDays.add(day);
    notifyListeners();
  }

  void selectDay(String day) {
    _selectedDays.clear();
    _selectedDays.add(day);
    notifyListeners();
  }

  void removeDays(String day) {
    _selectedDays.removeWhere((e) => e == day);
    notifyListeners();
  }

  void clearData() {
    _selectedDays = [];
  }

  bool isChecked(String day) {
    bool isCheck = _selectedDays.where((e) => e == day).toList().isNotEmpty;
    return isCheck;
  }

  DateTime _time = DateTime.now();
  DateTime get time => _time;

  final PreferencesHelper helper;

  void selectedTime(DateTime time) {
    _time = time;
    notifyListeners();
  }

  List<GudangModel> _listGudang = [];
  List<GudangModel> get listGudang => _listGudang;

  String _message = "";
  String get message => _message;

  Future<void> getListGudang() async {
    final result = await service.getListGudang();

    result.fold((failure) {
      _message = failure.message;
      notifyListeners();
    }, (result) {
      if (result?.data != null) {
        _listGudang = result?.data ?? [];
        notifyListeners();
      }
    });
  }

  String? _idNasabah;
  String? get idNasabah => _idNasabah;
  List<VilageAvailableModel> _listVilage = [];
  List<VilageAvailableModel> get listVilage => _listVilage;
  Future<void> getListVilagesAvail(String id) async {
    _idNasabah = await helper.getIdNasabah();
    final result = await service.getListVilageAvailable(id);
    result.fold((failure) {
      _message = failure.message;
      notifyListeners();
    }, (result) {
      if (result?.data != null) {
        _listVilage = result?.data ?? [];
        notifyListeners();
      }
    });
  }

  GudangModel? _selectedGudang;
  GudangModel? get selectedGudang => _selectedGudang;

  void selectGudang(GudangModel? gudangModel) {
    _selectedGudang = gudangModel;
    _selectedVilage = null;
    _listVilage = [];
    getListVilagesAvail(_selectedGudang?.id ?? "3");
    notifyListeners();
  }

  VilageAvailableModel? _selectedVilage;
  VilageAvailableModel? get selectedVilage => _selectedVilage;
  void selectVilage(VilageAvailableModel? vilageAvailableModel) {
    _selectedVilage = vilageAvailableModel;
    notifyListeners();
  }

  DataBukuAlamat? _dataBukuAlamat;
  DataBukuAlamat? get dataBukuAlamat => _dataBukuAlamat;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _ojekPrice = "0";
  String get ojekPrice => _ojekPrice;
  Future<void> getListUserAvaliableAddress(
      String idNasabahType, bool isDaily) async {
    _idNasabah = await helper.getIdNasabah();
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getListAvailableAddress(
        idGudang: _selectedGudang?.id ?? "0",
        idKelurahan: _selectedVilage?.idKelurahan ?? "0",
        idNasabah: _idNasabah ?? "0");
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _dataBukuAlamat = result?.result?.dataBukuAlamat;
      _state = RequestState.loaded;
      DataJenisNasabah? dataJenisNasabah = result?.result?.dataJenisNasabah;
      if (dataJenisNasabah?.result != null) {
        if (_time.isAfter(DateTime.now())) {
          if (dataJenisNasabah!.result!.isNotEmpty) {
            _ojekPrice = dataJenisNasabah.result
                    ?.where(
                        (element) => element.idJenisNasabah == idNasabahType)
                    .first
                    .hargaHariSeterusnya ??
                "0";
          }
        } else {
          if (dataJenisNasabah!.result!.isNotEmpty) {
            _ojekPrice = dataJenisNasabah.result
                    ?.where(
                        (element) => element.idJenisNasabah == idNasabahType)
                    .first
                    .hargaHariIni ??
                "0";
          }
        }
      }
      notifyListeners();
    });
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void selectAddress(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
