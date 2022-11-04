import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:flutter/material.dart';

class CardTransactionBSU extends StatelessWidget {
  final String? id;
  final String? status;
  final String? tglTransaksi;
  final String? totalTagihan;
  final String? sisaTagihan;
  const CardTransactionBSU(
      {super.key,
      this.id,
      this.status,
      this.tglTransaksi,
      this.totalTagihan,
      this.sisaTagihan});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(kDefaultPadding / 3),
      margin: const EdgeInsets.only(
          bottom: kDefaultPadding / 2,
          right: kDefaultPadding,
          left: kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            12,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 3),
                blurRadius: 30,
                spreadRadius: 2)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nomer Transaksi #${id ?? ""}",
                style: kBlackText.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              Text(
                tglTransaksi ?? "",
                style: kBlackText,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Total Tagihan",
                    style: kDarkGrayText,
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text(
                    FormatterExt()
                        .currency
                        .format(int.parse(totalTagihan ?? "0")),
                    style: kGreenText.copyWith(fontWeight: semiBold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status ?? "",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
