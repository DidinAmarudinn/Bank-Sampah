import 'package:bank_sampah/feature/withdraw/listrik/provider/listrik_provider.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../utils/formatter_ext.dart';
import '../../../../utils/request_state_enum.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/loading_button.dart';
import '../../../../widget/tb_button_primary_widget.dart';
import '../../../../widget/tb_textfield_border.dart';
import '../../model/ppob_request.dart';
import '../../pulsa/ui/success_page.dart';

class ListrikPascaScreen extends StatefulWidget {
  static const routeName = "/listrik-pasca-screen";
  const ListrikPascaScreen({super.key});

  @override
  State<ListrikPascaScreen> createState() => _ListrikPascaScreenState();
}

class _ListrikPascaScreenState extends State<ListrikPascaScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListrikProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: CustomAppBar(
            isHaveShadow: true,
            titlePage: "Tagihan Listrik",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomer Pelanggan",
              style: kBlackText.copyWith(fontWeight: semiBold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TBTextFieldWithBorder(
                    controller: controller,
                    hintText: "Masukan nomer pelanggan",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      provider.billCheck(controller.text);
                    } else {
                      SnackbarMessage.showSnackbar(
                          context, "Isi nomer pelanggan terlebih dahulu");
                    }
                  },
                  child: Text(
                    "Cek Tagihan",
                    style: kGreenText,
                  ),
                ),
              ],
            ),
            if (provider.billCheckModel?.trName != null)
              Expanded(
                  child: ListView(
                children: [
                  _buildRow(
                      "Nama Pelanggan", provider.billCheckModel?.trName ?? ""),
                  _buildRow(
                      "Nomer Pelanggan", provider.billCheckModel?.hp ?? ""),
                  _buildRow("Tarif / Daya",
                      "${provider.billCheckModel?.desc?.tarif} / ${provider.billCheckModel?.desc?.daya.toString()}"),
                  _buildRow(
                    "Total Tagihan",
                    FormatterExt()
                        .currencyFormatter
                        .format(provider.billCheckModel?.price ?? 0),
                  ),
                  provider.btnState == RequestState.loading
                      ? const LoadingButton(height: 40, width: double.infinity)
                      : TBButtonPrimaryWidget(
                          buttonName: "Bayar",
                          onPressed: () async {
                            PPOBRequest request = PPOBRequest(
                                tglTransaksi: FormatterExt()
                                    .dateFormat
                                    .format(DateTime.now()),
                                jenis: "listrik",
                                jenisProduct: "tagihan",
                                refId: provider.billCheckModel?.refId,
                                nomerRegistrasi: provider.billCheckModel?.hp,
                                totalTagihan:
                                    provider.billCheckModel?.price.toString(),
                                code: provider.billCheckModel?.code);
                            await provider.checkout(request);
                            if (!mounted) return;
                            if (provider.btnState == RequestState.loaded) {
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
              ))
          ],
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
