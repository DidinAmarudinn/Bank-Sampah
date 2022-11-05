import 'package:bank_sampah/feature/login/model/bsu_model.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_model.dart';
import 'package:bank_sampah/feature/profile/model/others_info_model.dart';
import 'package:bank_sampah/feature/profile/model/update_data_bsu_request.dart';
import 'package:bank_sampah/feature/profile/model/update_data_request.dart';
import 'package:bank_sampah/feature/profile/service/profile_service.dart';
import 'package:bank_sampah/utils/api_constants.dart';
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

  BSUModel? _bsuModel;
  BSUModel? get bsuModel => _bsuModel;
  String _email = "";
  String get email => _email;
  NasabahModel? _nasabahModel;
  NasabahModel? get nasabahModel => _nasabahModel;
  bool _isBsu = false;
  bool get isBsu => _isBsu;
  Future<void> getLevel() async {
    _isBsu = await helper.getLevel() == bsuCode;
    _email = await helper.getEmail() ?? "";
    notifyListeners();
    if (_isBsu) {
      getDataBsu();
    } else {
      getDataNasabah();
    }
  }

  Future<void> updateProfile(UpdateDataRequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    final idNasabah = await helper.getIdNasabah() ?? 0;
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

  Future<NasabahModel?> getDataNasabah() async {
    _state = RequestState.loading;
    int id = await helper.getId() ?? 0;
    final nasabahData = await service.getDataNsabah(id);
    nasabahData.fold((l) {
      _state = RequestState.error;
      _message = l.message;
      notifyListeners();
    }, (r) {
      _state = RequestState.loaded;
      helper.setPhoneNumber(r?.noKontak ?? "");
      helper.setFullName(r?.namaNasabah ?? "");
      _nasabahModel = r;
      selectStatusOjekSampah(r?.statusOjekSampah == "berlangganan");
      notifyListeners();
    });
    return _nasabahModel;
  }

  Future<BSUModel?> getDataBsu() async {
    _state = RequestState.loading;
    int id = await helper.getId() ?? 0;
    final bsuData = await service.getDataBsu(id.toString());
    bsuData.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (result) {
      if (result == null) {
        _state = RequestState.error;
        _message = "Error Silahkan Coba Kembali";
      } else {
        _bsuModel = result;
        helper.setIdBsu(result.id ?? "0");
        helper.setPhoneNumber(result.noKontak ?? "");
        helper.setFullName(result.namaUnit ?? "");
        _selectedDay = result.hariAngkut ?? "";
        _isActive = result.status == "Aktif";
        if (result.tglAngkut != "0") {
          _tanggalAngkut = int.parse(result.tglAngkut ?? "1");
        }
        _state = RequestState.loaded;
      }
      notifyListeners();
    });
    return _bsuModel;
  }

  Future<void> updateProfileBsu(UpdateDataBSURequest request) async {
    _state = RequestState.loading;
    notifyListeners();
    final idBsu = await helper.getIdBsu() ?? 0;
    final result = await service.updateProfileBSU(request, idBsu.toString());
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

  int _index = 0;
  int get index => _index;

  String _description =
      "Untuk lanjut mengubah, masukkan password akunmu saat ini.";
  String get description => _description;

  String _buttonName = "Lanjut";
  String get buttonName => _buttonName;
  void nextPage() {
    _index++;
    if (_index == 1) {
      _description = "Silakhan buat password baru akunmu.";
      _buttonName = "Lanjut";
    }
    if (_index == 2) {
      _buttonName = "Ubah Password";
      _description =
          "Konfirmasi password dengan memasukkan ulang password baru yang kamu buat.";
    }
    notifyListeners();
  }

  void resetIndex() {
    _index = 0;
    _description = "Untuk lanjut mengubah, masukkan password akunmu saat ini.";
    _buttonName = "Lanjut";
    notifyListeners();
  }

  void previousPage() {
    _index--;
    if (index == 0) {
      _description =
          "Untuk lanjut mengubah, masukkan password akunmu saat ini.";
      _buttonName = "Lanjut";
    }
    if (_index == 1) {
      _description = "Silakhan buat password baru akunmu.";
      _buttonName = "Lanjut";
    }
    if (_index == 2) {
      _buttonName = "Ubah Password";
      _description =
          "Konfirmasi password dengan memasukkan ulang password baru yang kamu buat.";
    }
    notifyListeners();
  }

  String _takePeriod = "harian";
  String get takePeriod => _takePeriod;

  void changeTakePeroid(bool isDaily) {
    if (isDaily) {
      _takePeriod = "harian";
    } else {
      _takePeriod = "bulanan";
    }
    notifyListeners();
  }

  List<String> listDay = [
    "Minggu",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu"
  ];
  String _selectedDay = "";
  String get selectedDay => _selectedDay;
  void changeSelectedDay(int index) {
    _selectedDay = listDay[index];
    notifyListeners();
  }

  bool _isActive = true;
  bool get isActive => _isActive;

  void changeStatus(bool newVal) {
    _isActive = newVal;
    notifyListeners();
  }

  int _tanggalAngkut = 1;
  int get tanggalAngkut => _tanggalAngkut;
  void changeSlider(int newVal) {
    _tanggalAngkut = newVal;
    notifyListeners();
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

  Future<void> changePassword(String newPassword) async {
    _state = RequestState.loading;
    notifyListeners();
    final userid = await helper.getId() ?? 0;
    final result = await service.changePassword(newPassword, userid.toString());
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
