import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '../../../themes/constants.dart';

class DetailTransactionPPOB extends StatelessWidget {
  final TransactionResult? result;
  const DetailTransactionPPOB({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Transaksi PPOB"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          children: [_buildWidget()],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            toBeginningOfSentenceCase(label.replaceAll("_", " ")) ?? "",
            style: kBlackText,
          ),
          Text(
            val,
            style: kBlackText.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildWidget() {
    if (result?.hasilPpobListrik != null) {
      return Column(
        children: result!.hasilPpobListrik!
            .toJson()
            .map((key, value) => MapEntry(
                key,
                value != null
                    ? _buildRow(key, value != "" ? value.toString() : "-")
                    : const SizedBox()))
            .values
            .toList(),
      );
    } else if (result?.hasilPpobData != null) {
      return Column(
        children: result!.hasilPpobData!
            .toJson()
            .map((key, value) => MapEntry(
                key,
                value != null
                    ? _buildRow(key, value != "" ? value.toString() : "-")
                    : const SizedBox()))
            .values
            .toList(),
      );
    } else if (result?.hasilPpobPulsa != null) {
      return Column(
        children: result!.hasilPpobPulsa!
            .toJson()
            .map((key, value) => MapEntry(
                key,
                value != null
                    ? _buildRow(key, value != "" ? value.toString() : "-")
                    : const SizedBox()))
            .values
            .toList(),
      );
    } else if (result?.hasilPpobPDAM != null) {
      return Column(
        children: result!.hasilPpobPDAM!
            .toJson()
            .map((key, value) => MapEntry(
                key,
                value != null
                    ? _buildRow(key, value != "" ? value.toString() : "-")
                    : const SizedBox()))
            .values
            .toList(),
      );
    } else {
      return const Center(
        child: Text("Data tidak ditemukan"),
      );
    }
  }
}
