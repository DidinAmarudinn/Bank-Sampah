import 'package:bank_sampah/feature/bsu/ui/bsu_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/nasabah_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/constants.dart';
import '../../../widget/card_ojek_sampah.dart';

class BottomSheetBSU extends StatelessWidget {
  const BottomSheetBSU({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                "Pilih menu",
                style: kGreenText.copyWith(fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              children: [
                CardOjekSampah(
                  titile: "Beli Sampah",
                  color: kDarkGreen,
                  isBsu: true,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(NasabahScreen.routeName);
                  },
                  subTitle: "Beli sampah dari nasabah",
                ),
                CardOjekSampah(
                  titile: "Jual Sampah",
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(BSUScreen.routeName);
                  },
                  color: kGreen,
                  isBsu: true,
                  subTitle: "Jual sampah kepada BSI",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
