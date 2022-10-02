
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';

class AddDataNasabahScreen extends StatefulWidget {
  static const routeName = "/add-data-nasabah-page";
  const AddDataNasabahScreen({Key? key}) : super(key: key);

  @override
  State<AddDataNasabahScreen> createState() => _AddDataNasabahScreenState();
}

class _AddDataNasabahScreenState extends State<AddDataNasabahScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerVilage = TextEditingController();
  final TextEditingController controllerDetailAddress = TextEditingController();
  final TextEditingController controllerNoTlp = TextEditingController();
  @override
  void initState() {
    super.initState();
    getNasabahType();
  }

  void getNasabahType() {
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getNasabahCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: CustomAppBar(
                  titlePage: "Tambah data nasabah",
                  isHaveShadow: true,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                          controller: controllerName,
                          hintText: "Masukan Nama Penerima "),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Alamat",
                        style: kDarkGrayText.copyWith(fontWeight: semiBold),
                      ),
                      TBTextFieldWithBorder(
                        controller: controllerVilage,
                        hintText: "Masukan Kelurahan",
                      ),
                      TBTextFieldWithBorder(
                        controller: controllerDetailAddress,
                        hintText: "Masukan Alamat Lengkap",
                        maxLines: 4,
                      ),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: TBButtonPrimaryWidget(
                  buttonName: "Simpan",
                  onPressed: () {},
                  height: 40,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
