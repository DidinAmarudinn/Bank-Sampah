import 'package:intl/intl.dart';

class FormatterExt {
  final currencyFormatter =
      NumberFormat.currency(locale: 'ID', symbol: "Rp ", decimalDigits: 0);

  final currency =
      NumberFormat.currency(locale: 'ID', symbol: "", decimalDigits: 0);

  final dateFormat = DateFormat('yyyy-MM-dd');
  Map<int, String> weekdayName = {
    1: "Senin",
    2: "Selasa",
    3: "Rabu",
    4: "Kamis",
    5: "Jumat",
    6: "Sabtu",
    7: "Minggu"
  };
}
