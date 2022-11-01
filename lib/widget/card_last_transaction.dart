import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

class CardLastTransaction extends StatelessWidget {
  final TransactionResult? transactionResult;
  const CardLastTransaction({Key? key, required this.transactionResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.all(kDefaultPadding / 3),
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kGreyColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIcon(),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactionResult?.idTransaksi ?? "",
                  style: kDarkGrayText.copyWith(fontWeight: bold, fontSize: 12),
                ),
                Text(
                  transactionResult?.getTransactionType() ?? "",
                  style: kGreyText.copyWith(fontSize: 12),
                ),
                Text(
                  transactionResult?.getDisplayedDate() ?? "",
                  style: kGreyText.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                transactionResult?.getPoint() ?? "",
                style: kDarkGrayText.copyWith(fontWeight: bold, fontSize: 12),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                transactionResult?.status ?? "",
                style: kPasterText.copyWith(fontWeight: bold, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildIcon() {
    if (transactionResult?.tipe == "ojek_sampah") {
       return Container(
        padding:const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: kDarkGreen,
          shape: BoxShape.circle
        ),
        child: Image.asset(
          kIcMotor,
          width: 15,
        ),
      );
    } else if (transactionResult?.getTransactionType().toLowerCase() == "pulsa") {
      return Container(
        padding:const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: kDarkGreen,
          shape: BoxShape.circle
        ),
        child: Image.asset(
          kIcPuls,
          width: 15,
        ),
      );
    } else if (transactionResult?.getTransactionType().toLowerCase() == "listrik") {
       return Container(
        padding:const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: kDarkGreen,
          shape: BoxShape.circle
        ),
        child: Image.asset(
          kIcListrik,
          width: 15,
        ),
      );
    } else if (transactionResult?.getTransactionType() == "PDAM") {
       return Container(
        padding:const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: kDarkGreen,
          shape: BoxShape.circle
        ),
        child: Image.asset(
          kIcPdam,
          width: 15,
        ),
      );
    } else {
      return const SizedBox(width: 25,);
    }
  }
}
