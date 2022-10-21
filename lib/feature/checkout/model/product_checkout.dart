// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';

class ProductCheckout {
  String uid;
  TrashModel trashModel;
  double weight;

  ProductCheckout({
    required this.uid,
    required this.trashModel,
    required this.weight,
  });

  String getTotal(bool isBsu) {
    if (isBsu) {
      double price = double.parse(trashModel.hargaBeliUnit ?? "0.0");
      return FormatterExt().currencyFormatter.format(price * weight);
    } else {
      double price = double.parse(trashModel.hargaBeliNasabah ?? "0.0");
      return FormatterExt().currencyFormatter.format(price * weight);
    }
  }
}
