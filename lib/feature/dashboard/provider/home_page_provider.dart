import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/feature/dashboard/model/user_balance_model.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  String _fullName = "";
  String get fullName => _fullName;

  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  final PagingController<int, TransactionResult> pagingController =
      PagingController(firstPageKey: 0);

  bool _isLastPage = false;
  final int _numberOfTransactionPerRequest = 5;
  final DashboardService service;
  final PreferencesHelper helper;

  void changeSliderIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  Future<void> getUserBalance() async {
    _state = RequestState.loading;
    notifyListeners();
    int id = await helper.getId() ?? 0;
    final result = await service.getUserBalance("nasabah", id);
    result.fold((failure) {
      debugPrint(failure.message);
      _state = RequestState.error;
      notifyListeners();
    }, (userBalance) {
      _userBalance = userBalance;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> getUserData() async {
    _fullName = await helper.getFullName() ?? "";
    _phoneNumber = await helper.getPhoneNumber() ?? "";
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    notifyListeners();
  }

  Future<void> getListTransaction(int pageKey) async {
    try {
      String id = "";
      bool type = await helper.getLevel() == bsuCode;
      if (type) {
        id = await helper.getIdBsu() ?? "";
      } else {
         id = await helper.getIdNasabah() ?? "";
       
      }
      final result = await service.getListTransaction(
        id,
        pageKey + 1,
        _numberOfTransactionPerRequest,
        type,
      );
      result.fold((failure) {
        pagingController.error = failure.message;
      }, (transaction) {
        int transactionCount = transaction?.result?.length ?? 0;
        _isLastPage = transactionCount < _numberOfTransactionPerRequest;
        if (_isLastPage) {
          if (transaction?.result != null) {
            pagingController.appendLastPage(transaction!.result!);
          }
        } else {
          if (transaction?.result != null) {
            final nextPage = pageKey + 1;
            pagingController.appendPage(transaction!.result!, nextPage);
          }
        }
      });
    } catch (e) {
      pagingController.error = e;
    }
  }

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
    if (pagingController.itemList != null) {
      pagingController.dispose();
    }
    pagingController.addPageRequestListener((pageKey) {
      getListTransaction(pageKey);
    });
    getUserData();
  }

  void destroy() {
    pagingController.dispose();
  }
}
