import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/card_checkout_product.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';

import '../../../widget/custom_app_bar.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout-page';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: CustomAppBar(titlePage: "Checkout Sampah"),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: kGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -40,
                      top: 100,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDarkGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 72),
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return const CardCheckoutProduct();
                                  })),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding / 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      offset: const Offset(3, 3))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Harga Total",
                                  style: kBlackText.copyWith(
                                      fontSize: 11, fontWeight: light),
                                ),
                                Text(
                                  "Total : Rp.6.800.00 ",
                                  style:
                                      kGreenText.copyWith(fontWeight: semiBold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding),
                            child: TBButtonPrimaryWidget(
                              buttonName: "Tukarkan",
                              onPressed: () {},
                              height: 40,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
