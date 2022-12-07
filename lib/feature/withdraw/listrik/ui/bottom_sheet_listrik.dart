import 'package:bank_sampah/feature/withdraw/listrik/ui/listrik_pasca_screen.dart';
import 'package:bank_sampah/feature/withdraw/listrik/ui/listrik_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../themes/constants.dart';

class BottomSheetListrik extends StatelessWidget {
  const BottomSheetListrik({Key? key}) : super(key: key);

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
                "Pilih Jenis Penukaran",
                style: kGreenText.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  title: Text(
                    "Token",
                    style: kBlackText.copyWith(fontWeight: semiBold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(ListrikScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  title: Text(
                    "Tagihan (Pasca Bayar)",
                    style: kBlackText.copyWith(fontWeight: semiBold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(ListrikPascaScreen.routeName);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
