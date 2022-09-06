import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

class CardLastTransaction extends StatelessWidget {
  const CardLastTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding:const EdgeInsets.all(kDefaultPadding/3),
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kGreyColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            kIcCircleMotor,
            width: 22,
          ),
          const SizedBox(width: kDefaultPadding/2,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cecep Gunawan",
                  style: kDarkGrayText.copyWith(fontWeight: bold, fontSize: 12),
                ),
                Text(
                  "Ojek Sampah Harian",
                  style: kGreyText.copyWith(fontSize: 12),
                ),
                Text(
                  "27 Juli 2022",
                  style: kGreyText.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "12000 Poin",
                style: kDarkGrayText.copyWith(fontWeight: bold, fontSize: 12),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                "Berhasil",
                style: kPasterText.copyWith(fontWeight: bold, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
