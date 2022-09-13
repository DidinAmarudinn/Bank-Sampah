import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget/tb_button_primary_widget.dart';

class BottomSheetFilterTransaction extends StatefulWidget {
  const BottomSheetFilterTransaction({Key? key}) : super(key: key);

  @override
  State<BottomSheetFilterTransaction> createState() =>
      _BottomSheetFilterTransactionState();
}

class _BottomSheetFilterTransactionState
    extends State<BottomSheetFilterTransaction> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jenis Layanan".toUpperCase(),
              style: kGreenText.copyWith(fontWeight: bold, fontSize: 16),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemFilter(
              iconName: kIcMotor,
              title: "Ojek Sampah Harian",
              color: kDarkGreen,
              onCheck: (newVal) {
                provider.saveFilter(isOjekHarian: newVal);
              },
              isChecked: provider.filterModel?.isOjekHarian ?? false,
            ),
            ItemFilter(
              iconName: kIcMotor,
              title: "Ojek Sampah Berlangganan",
              color: kGreen,
              onCheck: (newVal) {
                provider.saveFilter(isOjekBerlanggan: newVal);
              },
              isChecked: provider.filterModel?.isOjekBerlanggan ?? false,
            ),
            ItemFilter(
              iconName: kIcPuls,
              title: "Pulsa",
              color: kDarkGreen,
              onCheck: (newVal) {
                provider.saveFilter(isPulsa: newVal);
              },
              isChecked: provider.filterModel?.isPulsa ?? false,
            ),
            ItemFilter(
              iconName: kIcListrik,
              title: "Listrik",
              color: kDarkGreen,
              onCheck: (newVal) {
                provider.saveFilter(isListrik: newVal);
              },
              isChecked: provider.filterModel?.isListrik ?? false,
            ),
            ItemFilter(
              iconName: kIcPdam,
              title: "Pdam",
              color: kDarkGreen,
              onCheck: (newVal) {
                provider.saveFilter(isPdam: newVal);
              },
              isChecked: provider.filterModel?.isPdam ?? false,
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Text(
              "Status Layanan".toUpperCase(),
              style: kGreenText.copyWith(fontWeight: bold, fontSize: 16),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemFilter(
              iconName: null,
              title: "Berhasil",
              color: kDarkGreen,
              onCheck: (newVal) {
                provider.saveFilter(isSuccess: newVal);
              },
              isChecked: provider.filterModel?.isSuccess ?? false,
            ),
            ItemFilter(
              iconName: null,
              title: "Dibatalkan",
              color: kGreen,
              onCheck: (newVal) {
                provider.saveFilter(isCancelled: newVal);
              },
              isChecked: provider.filterModel?.isCancelled ?? false,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: TBButtonPrimaryWidget(
                    buttonName: "Reset",
                    onPressed: () {
                      provider.resetFilter();
                      Navigator.pop(context);
                     
                    },
                    height: 40,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding * 2,
                ),
                Expanded(
                  child: TBButtonPrimaryWidget(
                    buttonName: "Masukan",
                    onPressed: () {},
                    height: 40,
                    width: double.infinity,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
