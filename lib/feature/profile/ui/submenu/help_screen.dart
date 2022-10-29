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
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
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
              const Positioned(
                left: kDefaultPadding,
                top: kDefaultPadding,
                child: CustomAppBar(
                  titlePage: "Bantuan",
                  isHaveShadow: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 70, left: kDefaultPadding, right: kDefaultPadding),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Consumer<ProfileProvider>(
                      builder: (context, provider, _) {
                        return Html(
                          data: provider.othersInfoModel?.bantuan ?? "",
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
