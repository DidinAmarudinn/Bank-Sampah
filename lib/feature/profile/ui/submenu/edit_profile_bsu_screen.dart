import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/dropdown_district.dart';
import '../../../../widget/dropdown_vilage.dart';
import '../../../../widget/tb_textfield_border.dart';

class EditProfileBSUScreen extends StatefulWidget {
  static const routeName = "/edit-profile-bsu-page";
  const EditProfileBSUScreen({super.key});
  @override
  State<EditProfileBSUScreen> createState() => _EditProfileBSUScreenState();
}

class _EditProfileBSUScreenState extends State<EditProfileBSUScreen> {
  final TextEditingController controllerAddressName = TextEditingController();
  final TextEditingController controllerDetailAddress = TextEditingController();
  final TextEditingController controllerUnitName = TextEditingController();
  final TextEditingController controllerJumlahLK = TextEditingController();
  final TextEditingController controllerJumlahPR = TextEditingController();
  final TextEditingController controllerKetuaUnit = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: CustomAppBar(
            titlePage: "Edit Profile BSU",
            isHaveShadow: true,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
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
            "Nama Unit",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerUnitName,
            hintText: "Masukan Nama Unit",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Jumlah Laki-Laki",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerJumlahLK,
            hintText: "Masukan Jumlah Laki-laki",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Jumlah Perempuan",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerJumlahPR,
            hintText: "Masukan Jumlah Perempuan",
          ),
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
            "Ketua Unit",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerKetuaUnit,
            hintText: "Masukan Ketua Unit",
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
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Tanggal Angkut: ",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                    min: 1,
                    max: 31,
                    label: provider.tanggalAngkut.toString(),
                    value: provider.tanggalAngkut.toDouble(),
                    onChanged: (newVal) {
                      provider.changeSlider(newVal.round());
                    }),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                provider.tanggalAngkut.toString(),
                style: kBlackText.copyWith(fontWeight: bold),
              )
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Hari Angkut",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          Wrap(
            children: List<Widget>.generate(
              provider.listDay.length,
              (int idx) {
                return Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding / 3),
                  child: ChoiceChip(
                    label: Text(provider.listDay[idx]),
                    selectedColor: kDarkGreen,
                    labelStyle: provider.selectedDay == provider.listDay[idx]
                        ? kWhiteText
                        : kDarkGrayText,
                    selected: provider.selectedDay == provider.listDay[idx],
                    onSelected: (bool selected) {
                      provider.changeSelectedDay(idx);
                    },
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Text(
                "Status Akun",
                style: kDarkGrayText.copyWith(fontWeight: semiBold),
              ),
              const Spacer(),
              Switch(
                value: provider.isActive,
                onChanged: (bool newVal) {
                  provider.changeStatus(newVal);
                },
              ),
            ],
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
