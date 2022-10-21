import 'package:intl/intl.dart';

class FormatterExt {
  final currencyFormatter =
      NumberFormat.currency(locale: 'ID', symbol: "Rp ", decimalDigits: 0);
}