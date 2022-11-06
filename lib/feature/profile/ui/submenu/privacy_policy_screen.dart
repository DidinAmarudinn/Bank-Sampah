import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../utils/request_state_enum.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = "/privacy-policy-page";
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: CustomAppBar(
                titlePage: "Kebijakan Privasi",
                isHaveShadow: true,
              ),
            ),
            Expanded(
              child: Consumer<ProfileProvider>(builder: (context, provider, _) {
                if (provider.state == RequestState.loaded) {
                  return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child:
                          Html(data: provider.othersInfoModel?.kebijakanPrivasi ?? ""));
                } else if (provider.state == RequestState.loading) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      size: 40,
                      color: kDarkGreen,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
