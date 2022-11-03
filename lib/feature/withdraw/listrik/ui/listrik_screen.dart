import 'package:bank_sampah/feature/withdraw/listrik/provider/listrik_provider.dart';
import 'package:bank_sampah/feature/withdraw/listrik/ui/checkout_listrik_screen.dart';
import 'package:bank_sampah/widget/loading_button.dart';
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
import '../../../../widget/tb_button_primary_widget.dart';
import '../../../../widget/tb_textfield_border.dart';

class ListrikScreen extends StatefulWidget {
  static const routeName = "/listrik-page";
  const ListrikScreen({super.key});

  @override
  State<ListrikScreen> createState() => _ListrikScreenState();
}

class _ListrikScreenState extends State<ListrikScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ListrikProvider>(context, listen: false).getPriceListToken();
    });
  }

  final TextEditingController controllerNoId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListrikProvider>(context);
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
                    titlePage: "Listrik",
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
                          "No. Pelanggan",
                          style: kDarkGrayText.copyWith(fontWeight: semiBold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: TBTextFieldWithBorder(
                          controller: controllerNoId,
                          hintText: "Masukan Nomor Pelanggan ",
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
                                    color: provider.selectToken ==
                                            provider.list[index]
                                        ? kDarkGreen.withOpacity(0.2)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: provider.selectToken ==
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
                                              provider.list[index].iconUrl ??
                                                  "",
                                          height: 40,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: kDefaultPadding / 2),
                                          child: Text(
                                            "Nominal ${FormatterExt().currency.format(int.parse(provider.list[index].pulsaNominal ?? "0"))}",
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
                                    : "Selanjutnya",
                                onPressed: () async {
                                  String customerId = controllerNoId.text;
                                  if (customerId.isNotEmpty &&
                                      provider.selectToken != null) {
                                    await provider
                                        .getSubscriberData(customerId);
                                    if (!mounted) return;
                                    if (provider.btnState ==
                                        RequestState.loaded) {
                                      context.push(
                                          CheckoutListrikScreen.routeName);
                                    } else {
                                      SnackbarMessage.showSnackbar(
                                          context, provider.message);
                                    }
                                  } else {
                                    SnackbarMessage.showSnackbar(context,
                                        "Masukan no pelanggan dan pilih nominal terlebih dahulu");
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
