import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = "/help-page";
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const CustomAppBar(titlePage: "Bantuan"),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<ProfileProvider>(
                  builder: (context, provider, _) {
                    return Html(data: provider.othersInfoModel?.bantuan ?? "");
                  },
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding,),
          ],
        ),
      )),
    );
  }
}
