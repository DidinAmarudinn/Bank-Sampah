import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
               crossAxisAlignment:  CrossAxisAlignment.start,
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
                const Expanded(child: SizedBox()),
                const Expanded(child: SizedBox())
                // const CircleMenuWidget(
                //   color: kDarkGreen,
                //   iconName: kIcPuls,
                //   menuName: "Pulsa",
                // ),
                // const CircleMenuWidget(
                //   color: kDarkGreen,
                //   iconName: kIcCalculator,
                //   menuName: "Listrik",
                // ),
              ],
            ),
            // const SizedBox(
            //   height: kDefaultPadding,
            // ),
            // Row(
            //   children: [
            //     const CircleMenuWidget(
            //       color: kDarkGreen,
            //       iconName: kIcPdam,
            //       menuName: "Pdam",
            //     ),
            //     CircleMenuWidget(
            //       onTap: () {
            //         Navigator.of(context).pop();
            //         context.push(WithdrawPointScreen.routeName);
            //       },
            //       color: kYellowColor,
            //       iconName: kIcPoin,
            //       menuName: "Tuker Poin",
            //     ),
            //     const Expanded(
            //         child: SizedBox(
            //       width: 20,
            //     ))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
