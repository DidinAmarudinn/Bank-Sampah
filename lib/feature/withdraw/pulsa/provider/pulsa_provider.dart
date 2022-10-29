import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:flutter/foundation.dart';

class PulsaProvider extends ChangeNotifier {
  PulsaModel? _selectedPulsaModel;
  PulsaModel? get selectePulsaModel => _selectedPulsaModel;

  void selectNominal(PulsaModel pulsaModel) {
    _selectedPulsaModel = pulsaModel;
    notifyListeners();
  }

  PaymentMethodModel? _selectedPaymentMethod;
  PaymentMethodModel? get selectedPaymentMethod => _selectedPaymentMethod;

  void selectPaymentMethod(PaymentMethodModel paymentMethodModel) {
    _selectedPaymentMethod = paymentMethodModel;
    notifyListeners();
  }
}
