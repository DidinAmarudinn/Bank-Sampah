import 'package:bank_sampah/feature/checkout/model/product_checkout.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/foundation.dart';

class CheckoutProvider extends ChangeNotifier {
  final List<ProductCheckout> _list = [];

  CheckoutProvider(this.helper);
  List<ProductCheckout> get list => _list;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  final PreferencesHelper helper;
  bool _isBsu = false;
  Future<void> addToCart(ProductCheckout productCheckout) async {
    _isBsu = await helper.getLevel() == "Bank Sampah Unit";
    _list.add(productCheckout);
    _totalPrice = 0;
    if (_isBsu) {
      for (var product in _list) {
        double price = double.parse(product.trashModel.hargaBeliUnit ?? "0.0");
        _totalPrice += (product.weight * price);
      }
    } else {
      for (var product in _list) {
        double price =
            double.parse(product.trashModel.hargaBeliNasabah ?? "0.0");
        _totalPrice += (product.weight * price);
      }
    }
    notifyListeners();
  }

  Future<void> removeFromCart(ProductCheckout productCheckout) async {
    _list.removeWhere((element) => element.uid == productCheckout.uid);
    _totalPrice = 0;
    if (_isBsu) {
      for (var product in _list) {
        double price = double.parse(product.trashModel.hargaBeliUnit ?? "0.0");
        _totalPrice += (product.weight * price);
      }
    } else {
      for (var product in _list) {
        double price =
            double.parse(product.trashModel.hargaBeliNasabah ?? "0.0");
        _totalPrice += (product.weight * price);
      }
    }
    notifyListeners();
  }

  Future<void> clearCart()async {
    _list.clear();
    _totalPrice = 0;
    notifyListeners();
  }
}
