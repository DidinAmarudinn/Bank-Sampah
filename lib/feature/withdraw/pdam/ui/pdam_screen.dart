import 'package:bank_sampah/feature/withdraw/pdam/provider/pdam_provider.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/success_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/dropdown_wilayah_pdam.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../widget/custom_app_bar.dart';
import '../../model/ppob_request.dart';

class PDAMScreen extends StatefulWidget {
  static const routeName = "/pdam-page";
  const PDAMScreen({super.key});

  @override
  State<PDAMScreen> createState() => _PDAMScreenState();
}

class _PDAMScreenState extends State<PDAMScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerCity = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PDAMProvider>(context, listen: false).getWilayahPDAM();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PDAMProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: CustomAppBar(
            isHaveShadow: true,
            titlePage: "PDAM",
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Nomer Pelanggan",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
              TBTextFieldWithBorder(
                controller: controller,
                hintText: "Masukan nomer pelanggan",
              ),
              Text(
                "Wilayah Kota/Kabupaten",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
              TBTextFieldWithBorder(
                controller: controllerCity,
                hintText: "Masukan Kota/Kabupaten",
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                "Pilih Wilayah",
                style: kBlackText.copyWith(fontWeight: semiBold),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              const DropdownWilayahPDAM(),
              const SizedBox(
                height: kDefaultPadding,
              ),
              TBButtonPrimaryWidget(
                  buttonName: "Check Bill",
                  onPressed: () async {
                    if (controller.text.isNotEmpty &&
                        provider.selectedPasca != null &&
                        controllerCity.text.isNotEmpty) {
                      await provider.billCheck(controller.text);
                      if (!mounted) return;
                      if (provider.billCheckModel?.trName == null) {
                        SnackbarMessage.showSnackbar(context, provider.message);
                      }
                    } else {
                      SnackbarMessage.showSnackbar(context,
                          "Silahkan masukan nomer pelangganan dan pilih wilayah");
                    }
                  },
                  height: 40,
                  width: double.infinity),
              if (provider.billCheckModel?.trName != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildRow(
                            "Nama PDAM", provider.billCheckModel?.trName ?? ""),
                        _buildRow("Nomer Pelanggan",
                            provider.billCheckModel?.hp ?? ""),
                        _buildRow(
                          "Total Tagihan",
                          FormatterExt()
                              .currencyFormatter
                              .format(provider.billCheckModel?.price ?? 0),
                        ),
                        provider.btnState == RequestState.loading
                            ? const LoadingButton(
                                height: 40, width: double.infinity)
                            : TBButtonPrimaryWidget(
                                buttonName: "Bayar",
                                onPressed: () async {
                                  PPOBRequest request = PPOBRequest(
                                      tglTransaksi: FormatterExt()
                                          .dateFormat
                                          .format(DateTime.now()),
                                      jenis: "PDAM",
                                      refId: provider.billCheckModel?.refId,
                                      nomerPelanggan:
                                          provider.billCheckModel?.hp,
                                      totalTagihan: provider
                                          .billCheckModel?.price
                                          .toString(),
                                      wilayah: controllerCity.text,
                                      code: provider.billCheckModel?.code);
                                  await provider.checkout(request);
                                  if (!mounted) return;
                                  if (provider.btnState ==
                                      RequestState.loaded) {
                                    context.go(SuccessPage.routeName);
                                  } else {
                                    SnackbarMessage.showSnackbar(
                                        context, provider.message);
                                  }
                                },
                                isDisable: !provider.isSufficientBalance,
                                height: 40,
                                width: double.infinity)
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: kBlackText,
          ),
          Text(
            val,
            style: kBlackText.copyWith(fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
