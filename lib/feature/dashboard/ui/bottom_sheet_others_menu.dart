import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/feature/withdraw/pdam/ui/pdam_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';
import '../../../widget/circle_menu_widget.dart';
import '../../withdraw/listrik/ui/bottom_sheet_listrik.dart';
import '../../withdraw/pulsa/ui/bottom_sheet_pulsa.dart';

class BottomSheetOthersMenu extends StatelessWidget {
  final bool isBsu;
  const BottomSheetOthersMenu({Key? key, required this.isBsu})
      : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleMenuWidget(
                  color: kPastelColor,
                  iconName: kIcCalculator,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(TrashCalculatorPage.routeName);
                  },
                  menuName: "Kalkulator\nSampah",
                ),
                // const Expanded(child: SizedBox()),
                // const Expanded(child: SizedBox())
                isBsu
                    ? const SizedBox()
                    : CircleMenuWidget(
                        color: kDarkGreen,
                        iconName: kIcPuls,
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
                        },
                        menuName: "Pulsa / Paket Data",
                      ),
                isBsu
                    ? const SizedBox()
                    : CircleMenuWidget(
                        color: kDarkGreen,
                        iconName: kIcCalculator,
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
                        menuName: "Listrik",
                      ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                CircleMenuWidget(
                  color: kDarkGreen,
                  iconName: kIcPdam,
                  menuName: "Pdam",
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(PDAMScreen.routeName);
                  },
                ),
                const Expanded(child: SizedBox()),
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
