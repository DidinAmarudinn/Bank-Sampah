import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/dropdown_district.dart';
import '../../../../widget/dropdown_nasabah_category.dart';
import '../../../../widget/dropdown_vilage.dart';
import '../../../../widget/tb_textfield_border.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "/edit-profile-page";
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controllerAddressName = TextEditingController();
  final TextEditingController controllerDetailAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: CustomAppBar(
            titlePage: "Edit Profile",
            isHaveShadow: true,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            "Jenis Nasabah",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          const DropdownNasabahType(),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Kecamatan",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          const DropdownDistrict(),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Kelurahan",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          const DropdownVilage(),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Email",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerAddressName,
            hintText: "Masukan Email",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "No Telepon",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerAddressName,
            hintText: "Masukan No Telepon",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Alamat",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerAddressName,
            hintText: "Masukan Alamat",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          TBButtonPrimaryWidget(
              buttonName: "Perbarui Data",
              onPressed: () {},
              height: 40,
              width: double.infinity)
        ],
      ),
    );
  }
}
