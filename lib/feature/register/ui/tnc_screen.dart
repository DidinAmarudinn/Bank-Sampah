import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
                  child: Consumer<ProfileProvider>(
                      builder: (context, provider, _) {
                    if (provider.state == RequestState.loaded) {
                      return SingleChildScrollView(
                          child: Html(
                        data: provider.othersInfoModel?.syaratKetentuan ?? "",
                      ));
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
