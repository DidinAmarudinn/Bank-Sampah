import 'package:bank_sampah/widget/tb_textfield_border.dart';
import 'package:flutter/material.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/tb_button_primary_widget.dart';

class WithdarwBankScreen extends StatefulWidget {
  static const routeName = '/withdraw-bank-page';
  const WithdarwBankScreen({Key? key}) : super(key: key);

  @override
  State<WithdarwBankScreen> createState() => _WithdarwBankScreenState();
}

class _WithdarwBankScreenState extends State<WithdarwBankScreen> {
  final TextEditingController controllerBankName = TextEditingController();
  final TextEditingController controllerNoRek = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: CustomAppBar(
                  titlePage: "Rekening Bank",
                  isHaveShadow: true,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bank Name",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                  TextField(
                    controller: controllerBankName,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.account_balance,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    "Nomor Rekening",
                    style: kDarkGrayText.copyWith(fontWeight: semiBold),
                  ),
                  TBTextFieldWithBorder(controller: controllerNoRek)
                ],
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: TBButtonPrimaryWidget(
                  buttonName: "Cek Rekening",
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
