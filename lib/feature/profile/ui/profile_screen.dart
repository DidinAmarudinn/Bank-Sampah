import 'package:bank_sampah/feature/dashboard/provider/main_page_provider.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/help_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/privacy_policy_screen.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_menu_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dashboard/provider/home_page_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      backgroundColor: kBackgroundGray,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Profile",
                  style: kGreenText.copyWith(
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    kIcNoProfile,
                    width: 120,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<HomePageProvider>(
                      builder: (context, value, _) => Text(
                        value.fullName,
                        style: kGreenText.copyWith(fontWeight: bold),
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Image.asset(
                      kIcEditProfile,
                      width: 14,
                    )
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 3,
                ),
                Consumer<HomePageProvider>(
                  builder: (context, value, _) => Text(
                    value.phoneNumber,
                    style: kGreyText,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            children: [
              Text(
                "Akun",
                style: kGreenText.copyWith(fontWeight: bold),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kBorderGray, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ItemMenuProfile(
                        iconName: Icons.person,
                        title: "Data Pribadi",
                        onTap: () {}),
                    const Divider(
                      height: 5,
                      thickness: 2,
                    ),
                    ItemMenuProfile(
                        iconName: Icons.check,
                        title: "Verifikasi Data Diri",
                        onTap: () {}),
                    const Divider(
                      height: 5,
                      thickness: 2,
                    ),
                    ItemMenuProfile(
                        iconName: Icons.lock,
                        title: "Ubah Password",
                        onTap: () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Pusat Bantuan",
                style: kGreenText.copyWith(fontWeight: bold),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kBorderGray, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ItemMenuProfile(
                        iconName: Icons.question_mark,
                        title: "Bantuan",
                        onTap: () {
                          context.push(HelpScreen.routeName);
                        }),
                    const Divider(
                      height: 5,
                      thickness: 2,
                    ),
                    ItemMenuProfile(
                        iconName: Icons.shield,
                        title: "Kebijakan Privasi",
                        onTap: () {
                          context.push(PrivacyPolicyScreen.routeName);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: kBorderGray, width: 2)),
                child: InkWell(
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    if (!mounted) return;
                    context.read<MainPageProvider>().changeTabIndex(0);
                    context.go(LoginPage.routeName);
                  },
                  splashColor: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: kDarkGreen,
                        size: 20,
                      ),
                      const SizedBox(
                        width: kDefaultPadding / 4,
                      ),
                      Text(
                        "Keluar",
                        style: kGreenText.copyWith(fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
