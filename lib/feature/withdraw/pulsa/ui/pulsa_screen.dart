import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/payment_method_screen.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/success_page.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/tb_button_primary_widget.dart';
import '../../../../widget/tb_textfield_border.dart';
import '../provider/pulsa_provider.dart';

class PulsaScreen extends StatefulWidget {
  static const routeName = '/withdraw-pulsa-page';
  const PulsaScreen({super.key});

  @override
  State<PulsaScreen> createState() => _PulsaScreenState();
}

class _PulsaScreenState extends State<PulsaScreen> {
  final TextEditingController controllerNoTelp = TextEditingController();
  final TextEditingController controllerNominal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            child: CustomAppBar(
              titlePage: "Pulsa",
              isHaveShadow: true,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    "No. Telepon",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: TBTextFieldWithBorder(
                    controller: controllerNoTelp,
                    hintText: "Masukan Nomor Telepon ",
                    iconName: Icons.phone_android,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    "Poin Anda: 100.000",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                ),
                Expanded(
                  child: Consumer<PulsaProvider>(
                    builder: (context, provider, _) => ListView.builder(
                      itemCount: dummyPulsa.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            provider.selectNominal(dummyPulsa[index]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPadding / 2),
                            margin: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 3,
                            ),
                            decoration: BoxDecoration(
                                color: provider.selectePulsaModel ==
                                        dummyPulsa[index]
                                    ? kDarkGreen.withOpacity(0.2)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: provider.selectePulsaModel ==
                                            dummyPulsa[index]
                                        ? kDarkGreen
                                        : Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      offset: const Offset(0, 8),
                                      blurRadius: 20,
                                      spreadRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dummyPulsa[index].nominal ?? "",
                                  style: kBlackText.copyWith(
                                      fontSize: 16, fontWeight: semiBold),
                                ),
                                const SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Harga",
                                      style: kDarkGrayText.copyWith(
                                          fontSize: 12, fontWeight: light),
                                    ),
                                    Text(
                                      dummyPulsa[index].price ?? "",
                                      style: kBlackText.copyWith(
                                          fontSize: 16, fontWeight: semiBold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                      horizontal: kDefaultPadding),
                  child: Consumer<PulsaProvider>(
                    builder: (context, provider, _) => TBButtonPrimaryWidget(
                      buttonName: "Tukarkan",
                      onPressed: () {
                        String tlp = controllerNoTelp.text;
                        if (tlp.isNotEmpty &&
                            provider.selectePulsaModel != null) {
                          context.push(PaymentMethodPage.routeName);
                        } else {
                          SnackbarMessage.showSnackbar(context,
                              "Masukan no telepon dan pilih nominal terlebih dahulu");
                        }
                      },
                      height: 40,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
