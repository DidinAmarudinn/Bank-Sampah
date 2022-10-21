import 'package:bank_sampah/feature/checkout/model/product_checkout.dart';
import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/trash_calculator/provider/calculator_provider.dart';
import '../utils/formatter_ext.dart';

class CardCheckoutProduct extends StatelessWidget {
  final ProductCheckout productCheckout;
  const CardCheckoutProduct({Key? key, required this.productCheckout})
      : super(key: key);

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
                  productCheckout.trashModel.jenisSampah ?? "",
                  style: kBlackText,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumlah ${productCheckout.weight}",
                      style:
                          kBlackText.copyWith(fontSize: 12, fontWeight: light),
                    ),
                    Consumer<CalculatorProvider>(builder: (context, val, _) {
                      if (val.isBsu) {
                        return Text(
                          "Harga: ${FormatterExt().currencyFormatter.format(double.parse(productCheckout.trashModel.hargaBeliUnit ?? "0.0"))} /Kg",
                          style: kGreenText.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        );
                      } else {
                        return Text(
                          "Harga: ${FormatterExt().currencyFormatter.format(double.parse(productCheckout.trashModel.hargaBeliNasabah ?? "0.0"))} /Kg",
                          style: kGreenText.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        );
                      }
                    }),
                    Consumer<CalculatorProvider>(
                      builder:(context, val, _) => Text(
                        "Total : ${productCheckout.getTotal(val.isBsu)}",
                        style: kGreenText.copyWith(fontWeight: semiBold),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<CheckoutProvider>()
                        .removeFromCart(productCheckout);
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
                        style:
                            kRedText.copyWith(fontWeight: light, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/ic_dummy_img.png",
            height: 85,
          )
        ],
      ),
    );
  }
}
