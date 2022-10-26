import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  static const routeName = "/success-page";
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Lottie.asset(kLottieAnimation),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Transaksi Berhasil",
            style: kGreenText.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: TBButtonPrimaryWidget(
                buttonName: "Kembali ke Dashboard",
                onPressed: () {
                  context.go(MainPage.routeName);
                },
                height: 40,
                width: double.infinity),
          )
        ],
      ),
    );
  }
}
