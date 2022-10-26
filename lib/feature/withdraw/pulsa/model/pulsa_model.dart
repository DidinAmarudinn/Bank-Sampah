// ignore_for_file: public_member_api_docs, sort_constructors_first
class PulsaModel {
  String? price;
  String? nominal;
  PulsaModel({
    this.price,
    this.nominal,
  });
}

List<PulsaModel> dummyPulsa = [
  PulsaModel(nominal: "5K", price: "Rp 6.500"),
  PulsaModel(nominal: "10K", price: "Rp 11.000"),
  PulsaModel(nominal: "15K", price: "Rp 16.000"),
  PulsaModel(nominal: "20K", price: "Rp 21.000"),
  PulsaModel(nominal: "25K", price: "Rp 26.000"),
  PulsaModel(nominal: "30K", price: "Rp 31.000"),
  PulsaModel(nominal: "50K", price: "Rp 50.000"),
  PulsaModel(nominal: "100K", price: "Rp 100.000"),
];

class PaymentMethodModel {
  String? name;
  PaymentMethodModel({
    this.name,
  });
}

List<PaymentMethodModel> dummyPayment = [
  PaymentMethodModel(name: "BCA"),
  PaymentMethodModel(name: "Gopay")
];
