import 'package:bank_sampah/feature/withdraw/bank/ui/withdraw_bank_screen.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/pulsa_screen.dart';
import 'package:bank_sampah/feature/withdraw/ui/bottom_sheet_ewallet.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/item_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/img_constants.dart';

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
                ItemWithdraw(
                    imageName: kIcCircleBank,
                    itemName: "Rekening Bank",
                    onTap: () {
                      context.push(WithdarwBankScreen.routeName);
                    }),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                ItemWithdraw(
                    imageName: kIcCircleEwallet,
                    itemName: "Dompet Elektronik",
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
                            return Wrap(children: const [BottomSheetEwallet()]);
                          });
                    }),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                ItemWithdraw(
                    imageName: kIcCircleBank,
                    itemName: "Pulsa",
                    onTap: () {
                      context.push(PulsaScreen.routeName);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
