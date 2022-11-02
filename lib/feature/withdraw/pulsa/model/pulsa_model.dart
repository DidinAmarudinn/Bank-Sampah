import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'pulsa_model.g.dart';

@JsonSerializable()
class PulsaModel {
  List<Datum>? data;

  PulsaModel({this.data});

  factory PulsaModel.fromJson(Map<String, dynamic> json) {
    return _$PulsaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PulsaModelToJson(this);
}

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
