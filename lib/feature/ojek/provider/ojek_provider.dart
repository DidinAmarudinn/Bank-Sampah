import 'package:bank_sampah/feature/ojek/model/detail_ojek_sampah_model.dart';
import 'package:bank_sampah/feature/ojek/model/give_rating_request.dart';
import 'package:bank_sampah/feature/ojek/model/gudang_model.dart';
import 'package:bank_sampah/feature/ojek/model/order_ojek_request.dart';
import 'package:bank_sampah/feature/ojek/model/vilage_available_model.dart';
import 'package:bank_sampah/feature/ojek/service/ojek_service.dart';
import 'package:bank_sampah/feature/user_available_address/data_buku_alamat.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

  String _transactionTime = "";
  String get transactionTime => _transactionTime;

  String _endTransactionTime = "";
  String get endTransactionTime => _endTransactionTime;

  void selectedTime(DateTime time) {
    _time = time;
    final f = DateFormat('yyyy-MM-dd');
    _transactionTime = f.format(_time);
    _endTransactionTime = f.format(
      DateTime(
        _time.year,
        _time.month,
        _time.day + 7,
      ),
    );
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
  int? _id;
  int? get idUser => _id;
  List<VilageAvailableModel> _listVilage = [];
  List<VilageAvailableModel> get listVilage => _listVilage;
  Future<void> getListVilagesAvail(String id) async {
    _idNasabah = await helper.getIdNasabah();
    _id = await helper.getId();
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

  Future<void> orderOjek(OrderOjekRequest? request) async {
    _idNasabah = await helper.getIdNasabah();
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.orderOjek(request);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      if (result) {
        _state = RequestState.loaded;
      } else {
        _state = RequestState.error;
        _message = "Gagal memesan ojek";
      }
      notifyListeners();
    });
  }

  void initialDate() {
    final f = DateFormat('yyyy-MM-dd');
    _transactionTime = f.format(_time);
    _endTransactionTime = f.format(
      DateTime(
        _time.year,
        _time.month,
        _time.day + 7,
      ),
    );
    notifyListeners();
  }

  double _rating = 1.0;
  double get rating => _rating;

  void changeRating(double newVal) {
    _rating = newVal;
    notifyListeners();
  }

  Future<void> giveRating(GiveRatingRequest request) async {
    _idNasabah = await helper.getIdNasabah();
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.giveRating(request);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  DetailOjekSampahModel? _detailOjekSampahModel;
  DetailOjekSampahModel? get detailData => _detailOjekSampahModel;

  Future<void> getTransactionDetail(String idTransaction) async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getDetailTransaction(idTransaction);
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      _detailOjekSampahModel = data?.data;
      notifyListeners();
    });
  }

  Future<void> launchUrlWA(String phoneNumber) async {
    launchUrl(
      Uri.parse(
          'https://wa.me/+$phoneNumber?text=Hi saya mau konfirmasi pembayaran ojek sampah'),
      mode: LaunchMode.externalApplication,
    );
  }
}
