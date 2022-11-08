import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget/tb_button_primary_widget.dart';

class BottomSheetFilterTransaction extends StatefulWidget {
  final bool isOnProgress;
  final bool? isCanceled;
  final Function onSaveFilterOnProgress;
  final Function onSaveDone;
  final Function onSaveCanceled;
  const BottomSheetFilterTransaction(
      {Key? key,
      required this.isOnProgress,
      required this.isCanceled,
      required this.onSaveFilterOnProgress,
      required this.onSaveDone,
      required this.onSaveCanceled})
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
                if (provider.index == 0) {
                  provider.saveFilterOnProgress(isOjekHarian: newVal);
                } else if (provider.index == 1) {
                  provider.saveFilterDone(isOjekHarian: newVal);
                } else {
                  provider.saveFilterCanceled(isOjekHarian: newVal);
                }
              },
              isChecked: provider.index == 0
                  ? (provider.filterModel?.isOjekHarian ?? false)
                  : provider.index == 1
                      ? (provider.filterModelDone?.isOjekHarian ?? false)
                      : (provider.filterModelCanceled?.isOjekHarian ?? false),
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
                if (provider.index == 0) {
                  provider.saveFilterOnProgress(isPulsa: newVal);
                } else if (provider.index == 1) {
                  provider.saveFilterDone(isPulsa: newVal);
                } else {
                  provider.saveFilterCanceled(isPulsa: newVal);
                }
              },
              isChecked: provider.index == 0
                  ? (provider.filterModel?.isPulsa ?? false)
                  : provider.index == 1
                      ? (provider.filterModelDone?.isPulsa ?? false)
                      : (provider.filterModelCanceled?.isPulsa ?? false),
            ),
            ItemFilter(
              iconName: kIcListrik,
              title: "Listrik",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (provider.index == 0) {
                  provider.saveFilterOnProgress(isListrik: newVal);
                } else if (provider.index == 1) {
                  provider.saveFilterDone(isListrik: newVal);
                } else {
                  provider.saveFilterCanceled(isListrik: newVal);
                }
              },
              isChecked: provider.index == 0
                  ? (provider.filterModel?.isListrik ?? false)
                  : provider.index == 1
                      ? (provider.filterModelDone?.isListrik ?? false)
                      : (provider.filterModelCanceled?.isListrik ?? false),
            ),
            ItemFilter(
              iconName: kIcPdam,
              title: "Pdam",
              color: kDarkGreen,
              onCheck: (newVal) {
                if (provider.index == 0) {
                  provider.saveFilterOnProgress(isPdam: newVal);
                } else if (provider.index == 1) {
                  provider.saveFilterDone(isPdam: newVal);
                } else {
                  provider.saveFilterCanceled(isPdam: newVal);
                }
              },
              isChecked: provider.index == 0
                  ? (provider.filterModel?.isPdam ?? false)
                  : provider.index == 1
                      ? (provider.filterModelDone?.isPdam ?? false)
                      : (provider.filterModelCanceled?.isPdam ?? false),
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),

            Row(
              children: [
                Expanded(
                  child: TBButtonPrimaryWidget(
                    buttonName: "Reset",
                    onPressed: () {
                      if (widget.isCanceled == true) {
                        provider.resetFilterCanceled();
                        widget.onSaveCanceled();
                      } else {
                        if (widget.isOnProgress) {
                          provider.resetFilterOnProgress();
                          widget.onSaveFilterOnProgress();
                        } else {
                          provider.resetFilterDone();
                          widget.onSaveDone();
                        }
                      }
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
                      if (widget.isCanceled == true) {
                        widget.onSaveCanceled();
                      } else {
                        if (widget.isOnProgress) {
                          widget.onSaveFilterOnProgress();
                        } else {
                          widget.onSaveDone();
                        }
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
