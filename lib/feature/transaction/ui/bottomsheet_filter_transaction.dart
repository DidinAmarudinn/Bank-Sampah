import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget/tb_button_primary_widget.dart';

class BottomSheetFilterTransaction extends StatefulWidget {
  final bool isOnProgress;
  const BottomSheetFilterTransaction({Key? key, required this.isOnProgress})
      : super(key: key);

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
              title: "Ojek Sampah",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isOjekHarian: newVal);
                } else {
                  provider.saveFilterDone(isOjekHarian: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isOjekHarian ?? false)
                  : (provider.filterModelDone?.isOjekHarian ?? false),
            ),
            // ItemFilter(
            //   iconName: kIcMotor,
            //   title: "Ojek Sampah Berlangganan",
            //   color: kGreen,
            //   onCheck: (newVal) {
            //     if (widget.isOnProgress) {
            //       provider.saveFilterOnProgress(isOjekBerlanggan: newVal);
            //     } else {
            //       provider.saveFilterDone(isOjekBerlanggan: newVal);
            //     }
            //   },
            //   isChecked: widget.isOnProgress
            //       ? (provider.filterModel?.isOjekBerlanggan ?? false)
            //       : (provider.filterModelDone?.isOjekBerlanggan ?? false),
            // ),
            ItemFilter(
              iconName: kIcPuls,
              title: "Pulsa",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isPulsa: newVal);
                } else {
                  provider.saveFilterDone(isPulsa: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isPulsa ?? false)
                  : (provider.filterModelDone?.isPulsa ?? false),
            ),
            ItemFilter(
              iconName: kIcListrik,
              title: "Listrik",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isListrik: newVal);
                } else {
                  provider.saveFilterDone(isListrik: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isListrik ?? false)
                  : (provider.filterModelDone?.isListrik ?? false),
            ),
            ItemFilter(
              iconName: kIcPdam,
              title: "Pdam",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isPdam: newVal);
                } else {
                  provider.saveFilterDone(isPdam: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isPdam ?? false)
                  : (provider.filterModelDone?.isPdam ?? false),
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
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isSuccess: newVal);
                } else {
                  provider.saveFilterDone(isSuccess: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isSuccess ?? false)
                  : (provider.filterModelDone?.isSuccess ?? false),
            ),
            ItemFilter(
              iconName: null,
              title: "Dibatalkan",
              color: kGreen,
              onCheck: (newVal) {
                if (widget.isOnProgress) {
                  provider.saveFilterOnProgress(isCancelled: newVal);
                } else {
                  provider.saveFilterDone(isCancelled: newVal);
                }
              },
              isChecked: widget.isOnProgress
                  ? (provider.filterModel?.isCancelled ?? false)
                  : (provider.filterModelDone?.isCancelled ?? false),
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
                    onPressed: () {
                      Navigator.pop(context);
                      if (widget.isOnProgress) {
                        provider.pagingControllerOnProgress.refresh();
                      } else {
                        provider.pagingController.refresh();
                      }
                    },
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
