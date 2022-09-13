import 'package:bank_sampah/feature/withdraw/ui/withdraw_point_screen.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PoinCardWidget extends StatelessWidget {
  const PoinCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kDarkGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Poin anda",
                  style: kWhiteText.copyWith(
                    fontWeight: light,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "80000",
                  style: kWhiteText.copyWith(
                    fontWeight: semiBold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 2,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          InkWell(
            onTap: (){
              context.push(WithdrawPointScreen.routeName);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  kIcPoin,
                  width: 24,
                ),
                 Text(
                    "Tukar Poin",
                    style: kWhiteText.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
