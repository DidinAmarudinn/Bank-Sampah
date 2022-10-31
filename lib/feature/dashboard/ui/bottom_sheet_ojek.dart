import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/ojek_screen.dart';
import 'package:bank_sampah/widget/card_ojek_sampah.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';

class BottomSheetOjekSampah extends StatelessWidget {
  const BottomSheetOjekSampah({Key? key}) : super(key: key);

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
                "Pilih Layanan Ojek Sampah",
                style: kGreenText.copyWith(fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              children: [
                CardOjekSampah(
                  titile: "Ojek Sampah",
                  color: kDarkGreen,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<AddressProvider>().selectOjekType(true);
                    context.push(OjekScreen.routeName, extra: true);
                  },
                  subTitle: "Ojek Sampah Dalam Sekali Pesan",
                ),
                CardOjekSampah(
                  titile: "Ojek Sampah Berlangganan",
                  onTap: () {
                    context.read<AddressProvider>().selectOjekType(false);
                    // Navigator.of(context).pop();
                    // context.push(OjekScreen.routeName, extra: false);
                  },
                  color: kGreen,
                  subTitle: "Pelayanan Ojek Jemput Berkala Sesuai Jadwal",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
