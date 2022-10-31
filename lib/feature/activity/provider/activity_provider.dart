import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/service/activity_service.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../dashboard/model/slider_model.dart';

class ActivityProvider extends ChangeNotifier {
  DashboardService service = DashboardService();
  ActivityService activityService = ActivityService();

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<SliderModel?>? _listSlider = [];
  List<SliderModel?>? get listSlider => _listSlider;
  final PagingController<int, Activty> pagingController =
      PagingController(firstPageKey: 0);

  final PagingController<int, Activty> pagingControllerArticle =
      PagingController(firstPageKey: 0);

  bool _isLastPage = false;
  final int _numberOfTransactionPerRequest = 5;

  Future<void> getListSlider() async {
    _state = RequestState.loading;
    notifyListeners();
    final result = await service.getSlider("Kegiatan");
    result.fold((error) {
      _state = RequestState.error;
      _errorMessage = error.message;
      notifyListeners();
    }, (data) {
      _state = RequestState.loaded;
      _listSlider = data.data;
      notifyListeners();
    });
  }

  Future<void> addCountOfView(int id) async {
    await activityService.addCountOfView(id);
  }

  Future<void> getListActivity(int pageKey) async {
    try {
      final result = await activityService.getActivityList(
          pageKey + 1, _numberOfTransactionPerRequest);
      result.fold((failure) {
        pagingController.error = failure.message;
      }, (activityModel) {
        int transactionCount = activityModel?.result?.length ?? 0;
        _isLastPage = transactionCount < _numberOfTransactionPerRequest;
        if (_isLastPage) {
          if (activityModel?.result != null) {
            pagingController.appendLastPage(activityModel!.result!);
          }
        } else {
          if (activityModel?.result != null) {
            final nextPage = pageKey + 1;
            pagingController.appendPage(activityModel!.result!, nextPage);
          }
        }
      });
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<void> getListArticle(int pageKey) async {
    try {
      final result = await activityService.getListArticle(
          pageKey + 1, _numberOfTransactionPerRequest);
      result.fold((failure) {
        pagingControllerArticle.error = failure.message;
      }, (activityModel) {
        int transactionCount = activityModel?.result?.length ?? 0;
        _isLastPage = transactionCount < _numberOfTransactionPerRequest;
        if (_isLastPage) {
          if (activityModel?.result != null) {
            pagingControllerArticle.appendLastPage(activityModel!.result!);
          }
        } else {
          if (activityModel?.result != null) {
            final nextPage = pageKey + 1;
            pagingControllerArticle.appendPage(
                activityModel!.result!, nextPage);
          }
        }
      });
    } catch (e) {
      pagingControllerArticle.error = e;
    }
  }

  void start() {
    pagingController.addPageRequestListener((pageKey) {
      getListActivity(pageKey);
    });
    pagingControllerArticle.addPageRequestListener((pageKey) {
      getListArticle(pageKey);
    });
  }

  void destroy() {
    pagingController.dispose();
    pagingControllerArticle.dispose();
  }
}
