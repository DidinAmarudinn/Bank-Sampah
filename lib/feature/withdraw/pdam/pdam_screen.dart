import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

import '../../../widget/custom_app_bar.dart';

class PDAMScreen extends StatelessWidget {
  static const routeName = "/pdam-page";
  const PDAMScreen({super.key});

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
      body: Center(
        child: Text(
          "Layanan Tidak Tersedia",
          style: kBlackText.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
