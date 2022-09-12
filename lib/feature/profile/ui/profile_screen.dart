import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_menu_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    Text(
                      "Cecep Gunawan",
                      style: kGreenText.copyWith(fontWeight: bold),
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
                Text(
                  "085888231664",
                  style: kGreyText,
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
                        onTap: () {}),
                    const Divider(
                      height: 5,
                      thickness: 2,
                    ),
                    ItemMenuProfile(
                        iconName: Icons.shield,
                        title: "Kebijakan Privasi",
                        onTap: () {}),
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
                  onTap: (){
                    print("tapped");
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
