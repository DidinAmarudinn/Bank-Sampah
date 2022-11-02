import 'package:bank_sampah/feature/withdraw/listrik/provider/listrik_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutListrikScreen extends StatefulWidget {
  static const routeName = "/checkout-listrik-page";
  const CheckoutListrikScreen({super.key});

  @override
  State<CheckoutListrikScreen> createState() => _CheckoutListrikScreenState();
}

class _CheckoutListrikScreenState extends State<CheckoutListrikScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListrikProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                children: [
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  const CustomAppBar(
                    titlePage: "Checkout",
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              offset: const Offset(0, 2),
                              spreadRadius: 4,
                              blurRadius: 20)
                        ]),
                    child: Column(
                      children: [
                        Text(
                          "Tagihan Listrik",
                          style: kBlackText.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              kIcListrik,
                              width: 50,
                            ),
                            const SizedBox(
                              width: kDefaultPadding,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No. Meter / No. Pelanggan",
                                    style: kBlackText.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    (provider.plnSubscriberModel?.meterNo ?? "") +
                                        (" (${provider.plnSubscriberModel?.name ?? ""})"),
                                    style: kBlackText,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  _buildRowData(
                    "Tagihan",
                    FormatterExt().currencyFormatter.format(
                          provider.selectToken?.pulsaPrice ?? 0,
                        ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  _buildRowData(
                    "Biaya Admin",
                    FormatterExt().currencyFormatter.format(
                          2500,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      offset: const Offset(0, 2),
                      spreadRadius: 4,
                      blurRadius: 20)
                ],
              ),
              child: _buildRowData(
                "Total Pembayaran",
                FormatterExt().currencyFormatter.format(
                      (provider.selectToken?.pulsaPrice ?? 0) + 2500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TBButtonPrimaryWidget(
                buttonName: "Bayar Sekarang",
                onPressed: () {},
                height: 40,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowData(String name, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: kBlackText.copyWith(fontWeight: semiBold),
        ),
        Text(
          val,
          style: kBlackText.copyWith(fontWeight: reguler),
        ),
      ],
    );
  }
}
