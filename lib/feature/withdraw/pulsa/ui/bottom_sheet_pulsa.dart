import 'package:bank_sampah/feature/withdraw/paket_data/ui/paket_data_screen.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/pulsa_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../themes/constants.dart';

class BottomSheetPulsa extends StatelessWidget {
  const BottomSheetPulsa({Key? key}) : super(key: key);

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
                    contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  title: Text(
                    "Pulsa",
                   style: kBlackText.copyWith(fontWeight: semiBold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(PulsaScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  title: Text(
                    "Paket Data",
                    style: kBlackText.copyWith(fontWeight: semiBold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(PaketDataScreen.routeName);
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
