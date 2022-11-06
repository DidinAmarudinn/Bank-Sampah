import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';
import '../../profile/provider/profile_provider.dart';

class TNCScreen extends StatefulWidget {
  static const routeName = '/tnc-page';
  const TNCScreen({super.key});

  @override
  State<TNCScreen> createState() => _TNCScreenState();
}

class _TNCScreenState extends State<TNCScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProfileProvider>(context, listen: false).getOthersInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
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
                          Html(data: provider.othersInfoModel?.syaratKetentuan ?? ""));
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
