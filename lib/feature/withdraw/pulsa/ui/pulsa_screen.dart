import 'package:bank_sampah/feature/withdraw/model/ppob_request.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/success_page.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/tb_button_primary_widget.dart';
import '../../../../widget/tb_textfield_border.dart';
import '../provider/pulsa_provider.dart';

class PulsaScreen extends StatefulWidget {
  static const routeName = '/withdraw-pulsa-page';
  const PulsaScreen({super.key});

  @override
  State<PulsaScreen> createState() => _PulsaScreenState();
}

class _PulsaScreenState extends State<PulsaScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PulsaProvider>(context, listen: false).getPriceListPulsa();
    });
  }

  final TextEditingController controllerNoTelp = TextEditingController();
  final TextEditingController controllerNominal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PulsaProvider>(context);
    return Scaffold(
      body: provider.state == RequestState.loading
          ? const Center(
              child: SpinKitFadingCircle(
                size: 40,
                color: kDarkGreen,
              ),
            )
          : SafeArea(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                      horizontal: kDefaultPadding),
                  child: CustomAppBar(
                    titlePage: "Pulsa",
                    isHaveShadow: true,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text(
                          "No. Telepon",
                          style: kDarkGrayText.copyWith(fontWeight: semiBold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: TBTextFieldWithBorder(
                          controller: controllerNoTelp,
                          hintText: "Masukan Nomor Telepon ",
                          iconName: Icons.phone_android,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Text(
                          "Saldo Anda: ${provider.point}",
                          style: kDarkGrayText.copyWith(fontWeight: semiBold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.list.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                provider.selectNominal(provider.list[index]);
                              },
                              child: Container(
                                height: 100,
                                padding:
                                    const EdgeInsets.all(kDefaultPadding / 1.5),
                                margin: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding / 3,
                                ),
                                decoration: BoxDecoration(
                                    color: provider.selectePulsaModel ==
                                            provider.list[index]
                                        ? kDarkGreen.withOpacity(0.2)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: provider.selectePulsaModel ==
                                                provider.list[index]
                                            ? kDarkGreen
                                            : Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.06),
                                          offset: const Offset(0, 8),
                                          blurRadius: 20,
                                          spreadRadius: 4)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "https://cdn.mobilepulsa.net/img/logo/pulsa/small/telkomsel.png",
                                          height: 40,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: kDefaultPadding / 2),
                                          child: Text(
                                            "Nominal ${provider.list[index].getNominal()}",
                                            style: kBlackText.copyWith(
                                                fontSize: 14,
                                                fontWeight: semiBold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding / 2,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Harga",
                                          style: kDarkGrayText.copyWith(
                                              fontSize: 12, fontWeight: light),
                                        ),
                                        Text(
                                          FormatterExt()
                                              .currencyFormatter
                                              .format(provider
                                                  .list[index].pulsaPrice),
                                          style: kBlackText.copyWith(
                                              fontSize: 16,
                                              fontWeight: semiBold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2,
                            horizontal: kDefaultPadding),
                        child: provider.btnState == RequestState.loading
                            ? const LoadingButton(
                                height: 40, width: double.infinity)
                            : TBButtonPrimaryWidget(
                                isDisable: !provider.isSufficientBalance,
                                buttonName: !provider.isSufficientBalance
                                    ? "Saldo Tidak Cukup"
                                    : "Tukarkan",
                                onPressed: () async {
                                  String tlp = controllerNoTelp.text;
                                  if (tlp.isNotEmpty &&
                                      provider.selectePulsaModel != null) {
                                    PPOBRequest request = PPOBRequest(
                                      tglTransaksi: FormatterExt()
                                          .dateFormat
                                          .format(DateTime.now()),
                                      totalTagihan: provider
                                          .selectePulsaModel?.pulsaPrice
                                          .toString(),
                                      nomerTelepon: tlp,
                                      nominalPulsa: provider
                                          .selectePulsaModel?.pulsaNominal,
                                          codePulsa: provider.selectePulsaModel?.pulsaCode,
                                      jenis: "pulsa",
                                    );
                                    await provider.checkout(request);
                                    if (!mounted) return;
                                    if (provider.btnState ==
                                        RequestState.loaded) {
                                      context.go(SuccessPage.routeName);
                                    } else {
                                      SnackbarMessage.showSnackbar(
                                          context, provider.message);
                                    }
                                  } else {
                                    SnackbarMessage.showSnackbar(context,
                                        "Masukan no telepon dan pilih nominal terlebih dahulu");
                                  }
                                },
                                height: 40,
                                width: double.infinity,
                              ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
