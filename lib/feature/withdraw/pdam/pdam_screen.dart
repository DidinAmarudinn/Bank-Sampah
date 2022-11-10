import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_border.dart';
import 'package:flutter/material.dart';

import '../../../widget/custom_app_bar.dart';

class PDAMScreen extends StatefulWidget {
  static const routeName = "/pdam-page";
  const PDAMScreen({super.key});

  @override
  State<PDAMScreen> createState() => _PDAMScreenState();
}

class _PDAMScreenState extends State<PDAMScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: CustomAppBar(
            isHaveShadow: true,
            titlePage: "PDAM",
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Nomer Pelanggan",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
              TBTextFieldWithBorder(
                controller: controller,
                hintText: "Masukan nomer pelanggan",
              ),
              Text(
                "Kode Wilayah",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              TBButtonPrimaryWidget(
                  buttonName: "Check Bill",
                  onPressed: () {},
                  height: 40,
                  width: double.infinity),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
