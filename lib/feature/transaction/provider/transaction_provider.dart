import 'package:bank_sampah/feature/transaction/model/filter_model.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider extends ChangeNotifier {
  bool _isOnProgress = true;
  bool get isOnProgress => _isOnProgress;
  FilterModel? _filterModel;
  FilterModel? get filterModel => _filterModel;
  void changeTabBar(bool newValue) {
    _isOnProgress = newValue;
    notifyListeners();
  }

  void saveFilter(
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

  void resetFilter() {
    _filterModel = null;
    notifyListeners();
  }
}
