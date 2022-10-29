import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/provider/pulsa_provider.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/success_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PaymentMethodPage extends StatefulWidget {
  static const routeName = "/payment-method-page";
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Metode Pembayaran",
                style: kBlackText.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: Consumer<PulsaProvider>(
                  builder: (context, provider, _) => ListView.builder(
                    itemCount: dummyPayment.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          provider.selectPaymentMethod(dummyPayment[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          margin: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 3),
                          decoration: BoxDecoration(
                            color: provider.selectedPaymentMethod ==
                                    dummyPayment[index]
                                ? kDarkGreen.withOpacity(0.2)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: provider.selectedPaymentMethod ==
                                        dummyPayment[index]
                                    ? kDarkGreen
                                    : Colors.white),
                          ),
                          child: Text(
                            dummyPayment[index].name ?? "",
                            style: kBlackText.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              TBButtonPrimaryWidget(
                buttonName: "Bayar",
                onPressed: () {
                  context.go(SuccessPage.routeName);
                },
                height: 40,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
