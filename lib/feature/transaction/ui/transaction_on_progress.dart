import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class TransactionOnProgress extends StatelessWidget {
  const TransactionOnProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Semua transaksimu sudah selesai diproses! ",
            style: kDarkGrayText,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Lihat Transaksi",
              style: kGreenText.copyWith(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
