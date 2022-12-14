import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/model/user_balance_model.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';

import '../../../utils/api_constants.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;

  HomePageProvider(this.helper, this.service);
  int get currentIndex => _currentIndex;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  RequestState _sliderState = RequestState.empty;
  RequestState get sliderState => _sliderState;

  UserBalance? _userBalance;
  UserBalance? get userBalance => _userBalance;

  List<SliderModel?>? _listSlider = [];
  List<SliderModel?>? get listSlider => _listSlider;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _isBsu = false;
  bool get isBsu => _isBsu;

  String _saldo = "";
  String get saldo => _saldo;

  String _fullName = "";
  String get fullName => _fullName;

  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  // final PagingController<int, TransactionResult> pagingController =
  //     PagingController(firstPageKey: 0);

  final DashboardService service;
  final PreferencesHelper helper;

  void changeSliderIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  Future<void> getUserBalance() async {
    _state = RequestState.loading;
    notifyListeners();
    String id = "";
    String type = "";
    int idG = 0;
    _isBsu = await helper.getLevel() == bsuCode;
    if (_isBsu) {
      type = "bsu";
      id = await helper.getIdBsu() ?? "";
    } else {
      type = "nasabah";
      idG = await helper.getId() ?? 0;
    }
    if (type == "bsu") {
      final result = await service.getUserBalance(type, id);
      result.fold((failure) {
        debugPrint(failure.message);
        _state = RequestState.error;
        notifyListeners();
      }, (userBalance) {
        _userBalance = userBalance;
        helper.setPoint(userBalance?.result?.belumDibayar ?? "");
        _saldo = userBalance?.result?.belumDibayar ?? "";
        _state = RequestState.loaded;
        notifyListeners();
      });
    } else {
      final result = await service.getDataNsabah(idG);
      result.fold((failure) {
        debugPrint(failure.message);
        _state = RequestState.error;
        notifyListeners();
      }, (data) {
        helper.setPoint(data?.saldo ?? "");
        _saldo = data?.saldo ?? "";
        _state = RequestState.loaded;
        notifyListeners();
      });
    }
  }

  Future<void> getUserData() async {
    _fullName = await helper.getFullName() ?? "";
    _phoneNumber = await helper.getPhoneNumber() ?? "";
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    notifyListeners();
  }

  // Future<void> getListTransaction(int pageKey) async {
  //   try {
  //     String id = "";
  //     bool type = await helper.getLevel() == bsuCode;
  //     if (type) {
  //       id = await helper.getIdBsu() ?? "";
  //     } else {
  //       id = await helper.getIdNasabah() ?? "";
  //     }
  //     final result = await service.getListTransaction(
  //       id,
  //       pageKey + 1,
  //       _numberOfTransactionPerRequest,
  //       type,
  //     );
  //     result.fold((failure) {
  //       pagingController.error = failure.message;
  //     }, (transaction) {
  //       int transactionCount = transaction?.result?.length ?? 0;
  //       _isLastPage = transactionCount < _numberOfTransactionPerRequest;
  //       if (_isLastPage) {
  //         if (transaction?.result != null) {
  //           pagingController.appendLastPage(transaction!.result!);
  //         }
  //       } else {
  //         if (transaction?.result != null) {
  //           final nextPage = pageKey + 1;
  //           pagingController.appendPage(transaction!.result!, nextPage);
  //         }
  //       }
  //     });
  //   } catch (e) {
  //     pagingController.error = e;
  //   }
  // }

  Future<void> getListSlider() async {
    _sliderState = RequestState.loading;
    notifyListeners();
    final result = await service.getSlider("Home");
    result.fold((error) {
      _sliderState = RequestState.error;
      _errorMessage = error.message;
      notifyListeners();
    }, (data) {
      _sliderState = RequestState.loaded;
      _listSlider = data.data;
      notifyListeners();
    });
  }

  void start() {
    // pagingController.addPageRequestListener((pageKey) {
    //   getListTransaction(pageKey);
    // });

    getUserData();
  }

  void destroy() {
    // pagingController.dispose();
  }
}
