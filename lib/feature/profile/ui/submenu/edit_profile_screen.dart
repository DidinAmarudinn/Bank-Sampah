import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/profile/model/update_data_request.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final TextEditingController controllerNoTlp = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
      Provider.of<ProfileProvider>(context, listen: false)
          .getDataNasabah()
          .then((value) {
        controllerAddressName.text = value?.alamat ?? "";
        controllerEmail.text = value?.email ?? "";
        controllerNoTlp.text = value?.noKontak ?? "";
        controllerName.text = value?.namaNasabah ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final nasabahProvider = Provider.of<NasabahProvider>(context);

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
            "Nama Nasabah",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerName,
            hintText: "Masukan Nama",
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Email",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          TBTextFieldWithBorder(
            controller: controllerEmail,
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
            controller: controllerNoTlp,
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
          Text(
            "Jenis jasa angkut",
            style: kDarkGrayText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  provider.selectStatusOjekSampah(true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding / 3),
                  decoration: BoxDecoration(
                    color: provider.statusOjekSampah == "berlangganan"
                        ? kDarkGreen
                        : kGreyColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Berlangganan",
                    style: kWhiteText,
                  ),
                ),
              ),
              const SizedBox(
                width: kDefaultPadding / 2,
              ),
              InkWell(
                onTap: () {
                  provider.selectStatusOjekSampah(false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding / 3),
                  decoration: BoxDecoration(
                    color: provider.statusOjekSampah == "tidak berlangganan"
                        ? kDarkGreen
                        : kGreyColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Tidak Berlangganan",
                    style: kWhiteText,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          provider.state == RequestState.loading
              ? const LoadingButton(height: 40, width: double.infinity)
              : TBButtonPrimaryWidget(
                  buttonName: "Perbarui Data",
                  onPressed: () async {
                    String email = controllerEmail.text;
                    String noKontak = controllerNoTlp.text;
                    String name = controllerName.text;
                    String alamat = controllerAddressName.text;
                    String? idKecamatan = nasabahProvider.selectedDistrict?.id;
                    String? idKelurahan = nasabahProvider.selectedVilage?.id;
                    String? idJenis = nasabahProvider.selectedNasabahType?.id;
                    String statusOjekSampah = provider.statusOjekSampah;
                    if (email.isNotEmpty &&
                        noKontak.isNotEmpty &&
                        name.isNotEmpty &&
                        alamat.isNotEmpty &&
                        idKecamatan != null &&
                        idKelurahan != null &&
                        idJenis != null) {
                      var request = UpdateDataRequest(
                          idJenis: idJenis,
                          idKecamatan: idKecamatan,
                          idKelurahan: idKelurahan,
                          namaNasabah: name,
                          noKontak: noKontak,
                          email: email,
                          alamat: alamat,
                          statusOjekSampah: statusOjekSampah);
                      await provider.updateProfile(request);
                      await provider.getDataNasabah();
                      if (!mounted) return;
                      if (provider.state == RequestState.loaded) {
                        SnackbarMessage.showSnackbar(
                            context, "Berhasil update profile");
                        context.read<HomePageProvider>().getUserData();
                        context.pop();
                      }
                      if (provider.state == RequestState.error) {
                        SnackbarMessage.showSnackbar(context, provider.message);
                      }
                    } else {
                      SnackbarMessage.showSnackbar(
                          context, "Isi semua field diatas");
                    }
                  },
                  height: 40,
                  width: double.infinity)
        ],
      ),
    );
  }
}
