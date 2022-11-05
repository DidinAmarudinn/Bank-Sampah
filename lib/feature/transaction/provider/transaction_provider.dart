import 'package:bank_sampah/feature/transaction/model/detail_transaction_nasabah_model.dart';
import 'package:bank_sampah/feature/transaction/model/filter_model.dart';
import 'package:bank_sampah/feature/transaction/service/transaction_service.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../dashboard/model/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  bool? _isOnProgress;

  TransactionProvider(this.helper);
  bool? get isOnProgress => _isOnProgress;
  FilterModel? _filterModel;
  FilterModel? get filterModel => _filterModel;

  FilterModel? _filterModelDone;
  FilterModel? get filterModelDone => _filterModelDone;
  void changeTabBar(bool newValue) {
    _isOnProgress = newValue;
    notifyListeners();
  }

  final PreferencesHelper helper;

  final TransactionService service = TransactionService();

  void saveFilterOnProgress(
      {bool? isOjekHarian,
      bool? isOjekBerlanggan,
      bool? isPulsa,
      bool? isPdam,
      bool? isListrik,
      bool? isSuccess,
      bool? isCancelled}) {
    FilterModel tempFilterModel = const FilterModel().copyWith(
        isCancelled: isCancelled ?? _filterModel?.isCancelled,
        isListrik: isListrik ?? _filterModel?.isListrik,
        isOjekBerlanggan: isOjekBerlanggan ?? _filterModel?.isOjekBerlanggan,
        isOjekHarian: isOjekHarian ?? _filterModel?.isOjekHarian,
        isPdam: isPdam ?? _filterModel?.isPdam,
        isPulsa: isPulsa ?? _filterModel?.isPulsa,
        isSuccess: isSuccess ?? _filterModel?.isSuccess);
    _filterModel = tempFilterModel;
    notifyListeners();
  }

  void saveFilterDone(
      {bool? isOjekHarian,
      bool? isOjekBerlanggan,
      bool? isPulsa,
      bool? isPdam,
      bool? isListrik,
      bool? isSuccess,
      bool? isCancelled}) {
    FilterModel tempFilterModel = const FilterModel().copyWith(
        isCancelled: isCancelled ?? _filterModelDone?.isCancelled,
        isListrik: isListrik ?? _filterModelDone?.isListrik,
        isOjekBerlanggan:
            isOjekBerlanggan ?? _filterModelDone?.isOjekBerlanggan,
        isOjekHarian: isOjekHarian ?? _filterModelDone?.isOjekHarian,
        isPdam: isPdam ?? _filterModelDone?.isPdam,
        isPulsa: isPulsa ?? _filterModelDone?.isPulsa,
        isSuccess: isSuccess ?? _filterModelDone?.isSuccess);
    _filterModelDone = tempFilterModel;
    notifyListeners();
  }

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;
  final PagingController<int, TransactionResult> pagingControllerOnProgress =
      PagingController(firstPageKey: 0);
  final PagingController<int, TransactionResult> pagingController =
      PagingController(firstPageKey: 0);

  bool _isLastPage = false;
  final int _numberOfTransactionPerRequest = 5;
  Future<void> getListTransaction(int pageKey, FilterModel? filterModel) async {
    try {
      String id = "";
      bool type = await helper.getLevel() == bsuCode;
      if (type) {
        id = await helper.getIdBsu() ?? "";
      } else {
        id = await helper.getIdNasabah() ?? "";
      }
      final result = await service.getListTransaction(
          id, pageKey + 1, _numberOfTransactionPerRequest, filterModel, type);
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

  Future<void> getListTransactionOnProgress(
      int pageKey, FilterModel? filterModel) async {
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
        filterModel,
        type,
      );
      result.fold((failure) {
        pagingControllerOnProgress.error = failure.message;
      }, (transaction) {
        int transactionCount = transaction?.result?.length ?? 0;
        _isLastPage = transactionCount < _numberOfTransactionPerRequest;
        if (_isLastPage) {
          if (transaction?.result != null) {
            pagingControllerOnProgress.appendLastPage(transaction!.result!);
          }
        } else {
          if (transaction?.result != null) {
            final nextPage = pageKey + 1;
            pagingControllerOnProgress.appendPage(
                transaction!.result!, nextPage);
          }
        }
      });
    } catch (e) {
      pagingControllerOnProgress.error = e;
    }
  }

  void start() {
    if (pagingController.hasListeners &&
        pagingControllerOnProgress.hasListeners) {
      pagingController.removeListener(() {});
      pagingControllerOnProgress.removeListener(() {});
    } else {
      pagingControllerOnProgress.addPageRequestListener((pageKey) {
        getListTransactionOnProgress(pageKey, _filterModel);
      });
      pagingController.addPageRequestListener((pageKey) {
        getListTransaction(pageKey, _filterModelDone);
      });
    }
  }

  void resetFilter() {
    _filterModel = null;
    notifyListeners();
  }

  DetailTransactionNasabahModel? _detailTransactionNasabahModel;
  DetailTransactionNasabahModel? get detailData =>
      _detailTransactionNasabahModel;

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
      _detailTransactionNasabahModel = data?.data;
      notifyListeners();
    });
  }
}
