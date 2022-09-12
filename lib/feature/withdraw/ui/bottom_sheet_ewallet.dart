import 'package:bank_sampah/feature/withdraw/ewallet/ui/withdraw_ewallet_screen.dart';
import 'package:bank_sampah/widget/circle_ewallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';

class BottomSheetEwallet extends StatelessWidget {
  const BottomSheetEwallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0, vertical: kDefaultPadding / 2),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                CircleEwallet(
                  iconName: kIcGopay,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(WithdrawEwalletScreen.routeName,
                        extra: "Gopay");
                  },
                  menuName: "Gopay",
                ),
                CircleEwallet(
                  iconName: kIcOvo,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(WithdrawEwalletScreen.routeName, extra: "OVO");
                  },
                  menuName: "OVO",
                ),
                CircleEwallet(
                  iconName: kIcShopeePay,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(WithdrawEwalletScreen.routeName,
                        extra: "Shopee Pay");
                  },
                  menuName: "Shopee Pay",
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                CircleEwallet(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(WithdrawEwalletScreen.routeName,
                        extra: "Dana");
                  },
                  iconName: kIcDana,
                  menuName: "Dana",
                ),
                CircleEwallet(
                  iconName: kIcLinkAja,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(WithdrawEwalletScreen.routeName,
                        extra: "Link Aja");
                  },
                  menuName: "Link Aja",
                ),
                const Expanded(
                    child: SizedBox(
                  width: 20,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
