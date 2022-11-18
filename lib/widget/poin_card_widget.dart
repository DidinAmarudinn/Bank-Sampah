import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class PoinCardWidget extends StatelessWidget {
  final String userBalance;
  const PoinCardWidget({Key? key, required this.userBalance}) : super(key: key);

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
                  "Saldo anda",
                  style: kWhiteText.copyWith(
                    fontWeight: light,
                    fontSize: 12,
                  ),
                ),
                Text(
                  userBalance,
                  style: kWhiteText.copyWith(
                    fontWeight: semiBold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: double.infinity,
          //   width: 2,
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.8),
          //   ),
          // ),
          // const SizedBox(
          //   width: kDefaultPadding / 2,
          // ),
          // InkWell(
          //   onTap: () {
          //     context.push(WithdrawPointScreen.routeName);
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Image.asset(
          //         kIcPoin,
          //         width: 24,
          //       ),
          //       Text(
          //         "Tukar Saldo",
          //         style: kWhiteText.copyWith(
          //           fontWeight: light,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
