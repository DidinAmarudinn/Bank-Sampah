import 'package:bank_sampah/feature/nasabah/model/add_nasabah_bsu_request.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../themes/constants.dart';
import '../../../utils/preference_helper.dart';
import '../../../utils/request_state_enum.dart';
import '../../../utils/snackbar_message.dart';
import '../../../widget/custom_app_bar.dart';
import '../../../widget/dropdown_district.dart';
import '../../../widget/dropdown_nasabah_category.dart';
import '../../../widget/dropdown_vilage.dart';
import '../../../widget/loading_button.dart';

class AddDataNasabahScreen extends StatefulWidget {
  static const routeName = "/add-data-nasabah-page";
  const AddDataNasabahScreen({Key? key}) : super(key: key);

  @override
  State<AddDataNasabahScreen> createState() => _AddDataNasabahScreenState();
}

class _AddDataNasabahScreenState extends State<AddDataNasabahScreen> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
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
  }

  void getNasabahType() {
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerAddress.dispose();
    controllerNoTlp.dispose();
    controllerPassword.dispose();
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerName.dispose();
    controllerAddressName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: CustomAppBar(
              isHaveShadow: true,
              titlePage: "Add data nasabah",
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  "Username",
                  style: kDarkGrayText.copyWith(fontWeight: semiBold),
                ),
                TBTextFieldWithBorder(
                    controller: controllerUsername,
                    hintText: "Masukan username untuk login nasabah"),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Text(
                  "Password",
                  style: kDarkGrayText.copyWith(fontWeight: semiBold),
                ),
                TBTextFieldWithBorder(
                    controller: controllerPassword,
                    hintText: "Masukan password untuk login nasabah"),
                const SizedBox(
                  height: kDefaultPadding / 2,
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
                  "Jenis Ojek Sampah",
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
                 Consumer<NasabahProvider>(
          builder: (context, value, _) => value.state ==
                  RequestState.loading
              ? const LoadingButton(height: 40, width: double.infinity)
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2),
                  child: TBButtonPrimaryWidget(
                    buttonName: "Tambah",
                    onPressed: () async {
                      String name = controllerName.text;
                      String address = controllerAddress.text;
                      String addressName = controllerAddressName.text;
                      String username = controllerUsername.text;
                      String password = controllerUsername.text;
                      String noTelp = controllerNoTlp.text;
                      String email = controllerEmail.text;
                      String? id = await helper.getIdBsu();
                      String? districsId = value.selectedDistrict?.id;
                      String? vilageId = value.selectedVilage?.id;
                      String? idType = value.selectedNasabahType?.id;
                      String statusOjekSampah = value.statusOjekSampah;
                      if (name.isNotEmpty &&
                          username.isNotEmpty &&
                          password.isNotEmpty &&
                          address.isNotEmpty &&
                          addressName.isNotEmpty &&
                          noTelp.isNotEmpty &&
                          email.isNotEmpty &&
                          id != null &&
                          districsId != null &&
                          vilageId != null &&
                          idType != null) {
                        AddNasabahBsuRequest request =
                            AddNasabahBsuRequest(
                                userName: username,
                                password: password,
                                idBsu: id,
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
                        await value.addNasabahBsu(request);
                        if (!mounted) return;
                        if (value.state == RequestState.loaded) {
                          SnackbarMessage.showSnackbar(
                              context, "Data nasabah berhasil disimpan");
                          value.getListNasabahBSU();
                          context.pop();
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
           const SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
