import 'package:bank_sampah/feature/checkout/model/checkout_request.dart';
import 'package:bank_sampah/feature/checkout/model/product_checkout.dart';
import 'package:bank_sampah/feature/checkout/service/checkout_service.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/foundation.dart';

class CheckoutProvider extends ChangeNotifier {
  final List<ProductCheckout> _list = [];

  CheckoutProvider(this.helper);
  List<ProductCheckout> get list => _list;

  CheckoutService service = CheckoutService();

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  double _additional = 0;
  double _discount = 0;

  double get additional => _additional;
  double get discount => _discount;

  double _totalPayment = 0;

  double get totalPayment => _totalPayment;

  final List<String> _prices = [];
  final List<String> _ids = [];
  final List<String> _quantities = [];

  List<String> get prices => _prices;
  List<String> get ids => _ids;
  List<String> get quantities => _quantities;

  final PreferencesHelper helper;
  bool _isBsu = false;
  bool get isBsu => _isBsu;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  Future<void> checkout(CheckoutRequest request, String idNasabah) async {
    _state = RequestState.loading;
    notifyListeners();
    int id = await helper.getId() ?? 0;
    final result = await service.checkout(request, id.toString(), idNasabah);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      if (result) {
        _state = RequestState.loaded;
        notifyListeners();
      } else {
        _state = RequestState.error;
        _message = "Data gagal dikirim";
        notifyListeners();
      }
    });
  }

  Future<void> checkRole() async {
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    notifyListeners();
  }

  Future<void> addToCart(ProductCheckout productCheckout) async {
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    _list.add(productCheckout);
    _totalPrice = 0;
    _prices.clear();
    _ids.clear();
    _quantities.clear();
    if (_isBsu) {
      for (var product in _list) {
        double price = double.parse(product.trashModel.hargaBeliUnit ?? "0.0");
        _totalPrice += (product.weight * price);
        _totalPayment = _totalPrice;
        _prices.add((product.weight * price).toString());
        _ids.add(product.trashModel.id ?? "");
        _quantities.add(product.weight.toString());
      }
    } else {
      for (var product in _list) {
        double price =
            double.parse(product.trashModel.hargaBeliNasabah ?? "0.0");
        _totalPrice += (product.weight * price);
        _totalPayment = _totalPrice;
        _prices.add((product.weight * price).toString());
        _ids.add(product.trashModel.id ?? "");
        _quantities.add(product.weight.toString());
      }
    }
    reset();
    notifyListeners();
  }

  Future<void> removeFromCart(ProductCheckout productCheckout) async {
    _list.removeWhere((element) => element.uid == productCheckout.uid);
    _totalPrice = 0;
    _prices.clear();
    _ids.clear();
    _quantities.clear();
    if (_isBsu) {
      for (var product in _list) {
        double price = double.parse(product.trashModel.hargaBeliUnit ?? "0.0");
        _totalPrice += (product.weight * price);
        _prices.add((product.weight * price).toString());
        _ids.add(product.trashModel.id ?? "");
        _quantities.add(product.weight.toString());
      }
    } else {
      for (var product in _list) {
        double price =
            double.parse(product.trashModel.hargaBeliNasabah ?? "0.0");
        _totalPrice += (product.weight * price);
        _prices.add((product.weight * price).toString());
        _ids.add(product.trashModel.id ?? "");
        _quantities.add(product.weight.toString());
      }
    }
    _totalPayment = _totalPrice;
    notifyListeners();
  }

  Future<void> clearCart() async {
    _list.clear();
    _totalPrice = 0;
    _totalPayment = 0;
    _prices.clear();
    _ids.clear();
    _quantities.clear();
    reset();
    notifyListeners();
  }

  bool _isShowAdditional = false;
  bool get isShowAdditional => _isShowAdditional;

  Future<void> showAditional(bool val, {bool? isFromDiscount = false}) async {
    if (_totalPrice > 0) {
      _isShowAdditional = val;
      if (val) {
        _totalPayment = _totalPrice + _additional;
      }

      if (val == false && isFromDiscount != true) {
        _totalPayment = _totalPrice;
      }
      notifyListeners();
    }
  }

  bool _isShowDiscount = false;
  bool get isShowDiscount => _isShowDiscount;

  Future<void> showCuttOf(bool val, {bool? isFromAddtional = false}) async {
    if (_totalPrice > 0) {
      _isShowDiscount = val;
      if (val) {
        _totalPayment = _totalPrice - _discount;
      }
      if (val == false && isShowAdditional != true) {
        _totalPayment = _totalPrice;
      }
      notifyListeners();
    }
  }

  void onChangeAddAditionl(double additional) {
    _additional = additional;
    _totalPayment = _totalPrice + _additional;

    notifyListeners();
  }

  void onChangeDiscount(double discount) {
    if (discount > 0) {
      _discount = discount;
      _totalPayment = _totalPrice - _discount;
    } else {
      _totalPayment = _totalPrice;
    }
    notifyListeners();
  }

  void reset() {
    _isShowAdditional = false;
    _isShowDiscount = false;
    _additional = 0;
    _discount = 0;
    notifyListeners();
  }
}
