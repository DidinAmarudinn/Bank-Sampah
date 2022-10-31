import 'package:bank_sampah/feature/address/model/add_address_request.dart';
import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/ojek_screen.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';
import '../../../widget/dropdown_district.dart';
import '../../../widget/dropdown_vilage.dart';
import '../../../widget/tb_textfield_border.dart';

class AddAddressScreen extends StatefulWidget {
  static const routeName = "/add-address-page";
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController controllerAddressName = TextEditingController();
  final TextEditingController controllerDetailAddress = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
                child: CustomAppBar(
                  titlePage: "Atur Alamat",
                  isHaveShadow: true,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kecamatan",
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
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
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            const DropdownVilage(),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              "Alamat Lengkap",
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
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
                              "Nama Alamat",
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
                            ),
                            TBTextFieldWithBorder(
                              controller: controllerAddressName,
                              hintText: "Masukan Nama Alamat",
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
                child: Consumer2<NasabahProvider, AddressProvider>(
                    builder: (context, nasabahProvider, addressProvider, _) {
                  if (addressProvider.state == RequestState.loading) {
                    return const LoadingButton(
                      height: 40,
                      width: double.infinity,
                    );
                  } else {
                    return TBButtonPrimaryWidget(
                      buttonName: "Simpan",
                      isDisable: false,
                      onPressed: () async {
                        String addressName = controllerAddressName.text;
                        String detailAddress = controllerDetailAddress.text;
                        if (addressName.isNotEmpty &&
                            detailAddress.isNotEmpty &&
                            nasabahProvider.selectedDistrict != null &&
                            nasabahProvider.selectedVilage != null) {
                          AddAddressRequest request = AddAddressRequest(
                            idKelurahan:
                                nasabahProvider.selectedVilage?.id ?? "0",
                            idKecamatan:
                                nasabahProvider.selectedDistrict?.id ?? "0",
                            namaAlamat: addressName,
                            alamatLengkap: detailAddress,
                          );
                          await addressProvider.addAddressNasabah(request);
                          if (!mounted) return;
                          if (addressProvider.state == RequestState.loaded) {
                            addressProvider.getUserAddress();
                            SnackbarMessage.showSnackbar(
                                context, "Berhasil menambahkan alamat");
                            context.go(OjekScreen.routeName,
                                extra: addressProvider.isDaily);
                          }
                          if (addressProvider.state == RequestState.error) {
                            SnackbarMessage.showSnackbar(
                                context, addressProvider.message);
                          }
                        } else {
                          SnackbarMessage.showSnackbar(
                              context, "Silahkan isi semua field di atas");
                        }
                      },
                      height: 40,
                      width: double.infinity,
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
