import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/tb_textfield_border.dart';

class WithdrawEwalletScreen extends StatefulWidget {
  static const routeName = '/withdraw-ewallet-page';
  final String eWalletName;

  const WithdrawEwalletScreen({Key? key, required this.eWalletName})
      : super(key: key);

  @override
  State<WithdrawEwalletScreen> createState() => _WithdrawEwalletScreenState();
}

class _WithdrawEwalletScreenState extends State<WithdrawEwalletScreen> {
  final TextEditingController controllerNoTelp = TextEditingController();
  final TextEditingController controllerNominal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: CustomAppBar(
                  titlePage: widget.eWalletName,
                  isHaveShadow: true,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Telepon",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                  TBTextFieldWithBorder(
                    controller: controllerNoTelp,
                    hintText: "Masukan Nomor Telepon ",
                    iconName: Icons.phone_android,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    "Nominal yang dicairkan",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                  TBTextFieldWithBorder(
                    controller: controllerNominal,
                    hintText: "Contoh : 50000",
                    iconName: Icons.monetization_on,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        kDefaultPadding, 0, kDefaultPadding / 3, 0),
                    height: 50,
                    decoration: BoxDecoration(
                        color: kGreenBgLight,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Poin anda saat ini 1000",
                            style: kGreenText.copyWith(
                                fontSize: 12, fontWeight: light),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2,
                            vertical: kDefaultPadding / 3,
                          ),
                          decoration: BoxDecoration(
                              color: kDarkGreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Tukar Semua",
                            style: kWhiteText.copyWith(
                                fontSize: 12, fontWeight: semiBold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: TBButtonPrimaryWidget(
                  buttonName: "Lanjut",
                  onPressed: () {},
                  height: 40,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
