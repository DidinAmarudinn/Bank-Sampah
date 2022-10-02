import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/feature/dashboard/model/user_balance_model.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;

  HomePageProvider(this.helper, this.service);
  int get currentIndex => _currentIndex;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  UserBalance? _userBalance;
  UserBalance? get userBalance => _userBalance;

  final PagingController<int, TransactionResult> pagingController =
      PagingController(firstPageKey: 0);

  bool _isLastPage = false;
  final int _numberOfTransactionPerRequest = 2;
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

  Future<void> getListTransaction(int pageKey) async {
    try {
      int id = await helper.getId() ?? 0;
      final result = await service.getListTransaction(
          id, pageKey + 1, _numberOfTransactionPerRequest);
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

  void start() {
    pagingController.addPageRequestListener((pageKey) {
      getListTransaction(pageKey);
    });
  }

  void destroy() {
    pagingController.dispose();
  }
}