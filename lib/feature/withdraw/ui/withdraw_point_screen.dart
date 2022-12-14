import 'package:bank_sampah/feature/withdraw/listrik/ui/bottom_sheet_listrik.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/bottom_sheet_pulsa.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/item_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/img_constants.dart';
import '../pdam/ui/pdam_screen.dart';

class WithdrawPointScreen extends StatefulWidget {
  static const routeName = '/withdraw-page';
  const WithdrawPointScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawPointScreen> createState() => _WithdrawPointScreenState();
}

class _WithdrawPointScreenState extends State<WithdrawPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: CustomAppBar(
                titlePage: "Tukar Poin",
                isHaveShadow: true,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Pencairan Poin",
              style: kDarkGrayText.copyWith(fontWeight: bold, fontSize: 16),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              children: [
                // ItemWithdraw(
                //     imageName: kIcCircleBank,
                //     itemName: "Rekening Bank",
                //     onTap: () {
                //       context.push(WithdarwBankScreen.routeName);
                //     }),
                // const SizedBox(
                //   height: kDefaultPadding,
                // ),
                // ItemWithdraw(
                //     imageName: kIcCircleEwallet,
                //     itemName: "Dompet Elektronik",
                //     onTap: () {
                //       showModalBottomSheet(
                //           isScrollControlled: true,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(24),
                //             ),
                //           ),
                //           context: context,
                //           builder: (context) {
                //             return Wrap(children: const [BottomSheetEwallet()]);
                //           });
                //     }),
                // const SizedBox(
                //   height: kDefaultPadding,
                // ),
                ItemWithdraw(
                    imageName: kIcPuls,
                    itemName: "Pulsa / Paket Data",
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: const [
                                BottomSheetPulsa(),
                              ],
                            );
                          });
                    }),

                const SizedBox(
                  height: kDefaultPadding,
                ),
                ItemWithdraw(
                  imageName: kIcListrik,
                  itemName: "Listrik",
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: const [
                              BottomSheetListrik(),
                            ],
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                ItemWithdraw(
                    imageName: kIcPdam,
                    itemName: "PDAM",
                    onTap: () {
                      context.push(PDAMScreen.routeName);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
