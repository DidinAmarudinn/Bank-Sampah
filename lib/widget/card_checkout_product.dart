import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class CardCheckoutProduct extends StatelessWidget {
  const CardCheckoutProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 3))
          ]),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duplex",
                  style: kBlackText,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumlah 1kg",
                      style: kBlackText.copyWith(fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      "Harga : 400 poin/kg",
                      style: kBlackText.copyWith(fontSize: 12, fontWeight: light),
                    ),
                    Text(
                      "Total : Rp.400",
                      style: kGreenText.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    debugPrint("Tapped");
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: kDefaultPadding / 4,
                      ),
                      Text(
                        "Hapus",
                        style: kRedText.copyWith(fontWeight: light, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/ic_dummy_img.png",height: 85,)
        ],
      ),
    );
  }
}
