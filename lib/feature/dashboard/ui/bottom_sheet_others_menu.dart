import 'package:flutter/material.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';
import '../../../widget/circle_menu_widget.dart';

class BottomSheetOthersMenu extends StatelessWidget {
  const BottomSheetOthersMenu({Key? key}) : super(key: key);

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
                "Pilih Layanan",
                style: kGreenText.copyWith(fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: const [
                CircleMenuWidget(
                  color: kPastelColor,
                  iconName: kIcCalculator,
                  menuName: "Kalkulator\nSampah",
                ),
                CircleMenuWidget(
                  color: kDarkGreen,
                  iconName: kIcPuls,
                  menuName: "Pulsa",
                ),
                CircleMenuWidget(
                  color: kDarkGreen,
                  iconName: kIcCalculator,
                  menuName: "Listrik",
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: const [
                CircleMenuWidget(
                  color: kDarkGreen,
                  iconName: kIcPdam,
                  menuName: "Pdam",
                ),
                CircleMenuWidget(
                  color: kYellowColor,
                  iconName: kIcPoin,
                  menuName: "Tuker Poin",
                ),
                Expanded(
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
