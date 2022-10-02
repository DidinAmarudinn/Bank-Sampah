import 'package:bank_sampah/feature/activity/ui/activity_screen.dart';
import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/provider/main_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/ui/bottom_sheet_ojek.dart';
import 'package:bank_sampah/feature/dashboard/ui/home_page.dart';
import 'package:bank_sampah/feature/profile/ui/profile_screen.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_screen.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main-page";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
 

  List<Widget> screens = const [
    HomePage(),
    TransactionScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];
  @override
  void dispose() {
    Provider.of<HomePageProvider>(context, listen: false).dispose();
    super.dispose();
  }
    @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<MainPageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: screens[provider.tabIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 7),
                )
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provider.changeTabIndex(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home,
                            color: provider.tabIndex == 0 ? Colors.black : kGreyColor),
                        Text(
                          "Beranda",
                          style: provider.tabIndex == 0
                              ? kBlackText.copyWith(
                                  fontSize: 12, fontWeight: semiBold)
                              : kLightGrayText.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     provider.changeTabIndex(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.history,
                            color: provider.tabIndex == 1 ? Colors.black : kGreyColor),
                        Text(
                          "Transaksi",
                          style: provider.tabIndex == 1
                              ? kBlackText.copyWith(
                                  fontSize: 12, fontWeight: semiBold)
                              : kLightGrayText.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provider.changeTabIndex(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.article,
                          color: provider.tabIndex == 2 ? Colors.black : kGreyColor,
                        ),
                        Text(
                          "Kegiatan",
                          style: provider.tabIndex == 2
                              ? kBlackText.copyWith(
                                  fontSize: 12, fontWeight: semiBold)
                              : kLightGrayText.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provider.changeTabIndex(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person,
                            color: provider.tabIndex == 3 ? Colors.black : kGreyColor),
                        Text(
                          "Profile",
                          style: provider.tabIndex == 3
                              ? kBlackText.copyWith(
                                  fontSize: 12, fontWeight: semiBold)
                              : kLightGrayText.copyWith(
                                  fontSize: 12, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: const [
                          BottomSheetOjekSampah(),
                        ],
                      );
                    });
              },
              child: Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(bottom: kDefaultPadding / 3),
                decoration: const BoxDecoration(
                    color: kDarkGreen, shape: BoxShape.circle),
                child: Image.asset(kIcMotor),
              ),
            ),
            Text(
              "Ojek Sampah",
              style: kGreenText.copyWith(fontWeight: bold, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }


}
