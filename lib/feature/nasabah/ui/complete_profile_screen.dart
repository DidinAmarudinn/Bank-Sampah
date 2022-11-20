import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/nasabah/model/complete_profile_request.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../themes/constants.dart';
import '../../../widget/dropdown_district.dart';
import '../../../widget/dropdown_nasabah_category.dart';
import '../../../widget/dropdown_vilage.dart';
import '../../../widget/tb_button_primary_widget.dart';
import '../../../widget/tb_textfield_border.dart';
import '../../dashboard/ui/main_page.dart';
import '../provider/nasabah_provider.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const routeName = "/complete-profile-screen";
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerAddress = TextEditingController();
  final TextEditingController controllerAddressName = TextEditingController();
  final TextEditingController controllerNoTlp = TextEditingController();
  late PreferencesHelper helper;
  @override
  void initState() {
    super.initState();
    helper =
        PreferencesHelper(sharedPreference: SharedPreferences.getInstance());
    getNasabahType();
    getNasabahName();
  }

  void getNasabahType() {
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
    });
  }

  void getNasabahName() {
    helper.getFullName().then((value) {
      print("nama $value");
      controllerName.text = value ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lengkapi data nasabah",
          style: kGreenText.copyWith(fontSize: 14),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
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
                        "Nama Nasabah",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                          controller: controllerName,
                          hintText: "Masukan nama nasabah"),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Email",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                          controller: controllerEmail,
                          hintText: "Masukan email nasabah"),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Nomor Telepon",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                        controller: controllerNoTlp,
                        hintText: "Masukan Nomor Telepon",
                      ),
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
                        "Alamat",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                        controller: controllerAddress,
                        hintText: "Masukan alamat lengkap nasabah",
                        maxLines: 4,
                      ),
                      Consumer<NasabahProvider>(
                        builder: (context, value, _) => Row(
                          children: [
                            Text(
                              "Tambah alamat ke buku alamat",
                              style: kBlackText.copyWith(fontSize: 12),
                            ),
                            const Spacer(),
                            Checkbox(
                              value: value.isAddToAddressBook,
                              checkColor: Colors.white,
                              activeColor: kDarkGreen,
                              onChanged: (newValue) {
                                value
                                    .changeIsAddToAddressBook(newValue ?? true);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Nama Alamat",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                        controller: controllerAddressName,
                        hintText: "Contoh : Rumah, Kantor dan lain - lain",
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Jenis Jasa Angkut",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Consumer<NasabahProvider>(
                        builder: (context, val, _) => Row(
                          children: [
                            InkWell(
                              onTap: () {
                                val.selectStatusOjekSampah(true);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding / 2,
                                    vertical: kDefaultPadding / 3),
                                decoration: BoxDecoration(
                                  color: val.statusOjekSampah == "berlangganan"
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
                                val.selectStatusOjekSampah(false);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding / 2,
                                    vertical: kDefaultPadding / 3),
                                decoration: BoxDecoration(
                                  color: val.statusOjekSampah ==
                                          "tidak berlangganan"
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
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<NasabahProvider>(
                builder: (context, value, _) => value.state ==
                        RequestState.loading
                    ? const LoadingButton(height: 40, width: double.infinity)
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: TBButtonPrimaryWidget(
                          buttonName: "Simpan dan lanjutkan",
                          onPressed: () async {
                            String name = controllerName.text;
                            String address = controllerAddress.text;
                            String addressName = controllerAddressName.text;
                            String noTelp = controllerNoTlp.text;
                            String email = controllerEmail.text;
                            int? id = await helper.getId();
                            String? districsId = value.selectedDistrict?.id;
                            String? statusOjekSampah = value.statusOjekSampah;
                            String? vilageId = value.selectedVilage?.id;
                            String? idType = value.selectedNasabahType?.id;
                            if (name.isNotEmpty &&
                                address.isNotEmpty &&
                                addressName.isNotEmpty &&
                                noTelp.isNotEmpty &&
                                email.isNotEmpty &&
                                id != null &&
                                districsId != null &&
                                vilageId != null &&
                                idType != null) {
                              CompleteProfileRequest request =
                                  CompleteProfileRequest(
                                      idUserNasabah: (id).toString(),
                                      idJenis: idType,
                                      idKecamatan: districsId,
                                      idKelurahan: vilageId,
                                      namaNasabah: name,
                                      noKontak: noTelp,
                                      email: email,
                                      alamat: address,
                                      addBukualamat:
                                          value.isAddToAddressBook ? "Y" : "T",
                                      namaAlamat: addressName,
                                      statusOjekSampah: statusOjekSampah);
                              await value.completeProfile(request);

                              if (!mounted) return;
                              if (value.isBsu) {
                                await context
                                    .read<LoginProvider>()
                                    .getDataBsu();
                              } else {
                                await context
                                    .read<LoginProvider>()
                                    .checkNasabahData();
                              }
                              if (!mounted) return;
                              if (value.state == RequestState.loaded) {
                                context.go(MainPage.routeName);
                              }
                              if (value.state == RequestState.error) {
                                SnackbarMessage.showSnackbar(
                                    context, value.messageCompleteProfile);
                              }
                            } else {
                              if (!mounted) return;
                              SnackbarMessage.showSnackbar(
                                  context, value.messageCompleteProfile);
                            }
                          },
                          height: 40,
                          width: double.infinity,
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
