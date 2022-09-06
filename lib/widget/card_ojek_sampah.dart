import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

import '../utils/img_constants.dart';

class CardOjekSampah extends StatelessWidget {
  final String titile;
  final String subTitle;
  final Color color;
  const CardOjekSampah({Key? key, required this.titile, required this.subTitle, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 4, horizontal: kDefaultPadding / 2),
        margin: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            border: Border.all(
              color: kGreyColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration:
                   BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  kIcMotor,
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titile,
                  style: kGreenText.copyWith(fontWeight: bold, fontSize: 12),
                ),
                Text(
                  subTitle,
                  style: kGreyText.copyWith(fontWeight: reguler, fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
