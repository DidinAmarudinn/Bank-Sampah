import 'package:bank_sampah/feature/withdraw/paket_data/provider/paket_data_provider.dart';
import 'package:bank_sampah/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../utils/formatter_ext.dart';
import '../../../../utils/request_state_enum.dart';
import '../../../../utils/snackbar_message.dart';
import '../../../../widget/custom_app_bar.dart';
import '../../../../widget/loading_button.dart';
import '../../../../widget/tb_button_primary_widget.dart';
import '../../../../widget/tb_textfield_border.dart';
import '../../model/ppob_request.dart';
import '../../pulsa/ui/success_page.dart';

class PaketDataScreen extends StatefulWidget {
  static const routeName = '/withdraw-paket-data-page';
  const PaketDataScreen({super.key});

  @override
  State<PaketDataScreen> createState() => _PaketDataScreenState();
}

class _PaketDataScreenState extends State<PaketDataScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PaketDataProvider>(context, listen: false).getPriceListData();
    });
  }

  final TextEditingController controllerNoTelp = TextEditingController();
  final TextEditingController controllerNominal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaketDataProvider>(context);
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
                    titlePage: "Paket Data",
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
                          "Pilih Operator",
                          style: kBlackText.copyWith(fontWeight: semiBold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 2),
                        child: Wrap(
                          children: List<Widget>.generate(
                            listOperatorPaketData.length,
                            (int idx) {
                              return ChoiceChip(
                                  label: Text(
                                    listOperatorPaketData[idx].name,
                                    style: kWhiteText,
                                  ),
                                  selected: provider.selectedOperator ==
                                      listOperatorPaketData[idx],
                                  selectedColor: kDarkGreen,
                                  backgroundColor: kYoungGreen,
                                  onSelected: (bool selected) {
                                    provider.selecteOperator(
                                        listOperatorPaketData[idx]);
                                  });
                            },
                          ).toList(),
                        ),
                      ),
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
                                height: 120,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                provider.list[index].iconUrl ??
                                                    "",
                                            height: 40,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: kDefaultPadding / 2),
                                            child: Text(
                                              provider.list[index]
                                                      .pulsaNominal ??
                                                  "",
                                              style: kBlackText.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: semiBold),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                              fontSize: 14,
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
                                      operator:
                                          provider.selectePulsaModel?.pulsaOp,
                                      nomerTelepon: tlp,
                                      codePulsa:
                                          provider.selectePulsaModel?.pulsaCode,
                                      nominalData: provider
                                          .selectePulsaModel?.pulsaNominal,
                                      jenis: "data",
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
