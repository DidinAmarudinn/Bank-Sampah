import 'package:bank_sampah/feature/checkout/model/checkout_request.dart';
import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_bsu_model.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/card_checkout_product.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_with_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../widget/custom_app_bar.dart';
import '../../../widget/tb_textfield_border.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout-page';
  final NasabahBSUModel? nasabahBSUModel;
  const CheckoutScreen({Key? key, this.nasabahBSUModel}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final controller = TextEditingController();
  final controllerAdditional = TextEditingController();
  final controllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Consumer<CheckoutProvider>(
                          builder: (context, provider, _) => CustomAppBar(
                              titlePage: provider.isBsu
                                  ? "Checkout Sampah"
                                  : "Kalkulator Sampah")),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: kGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -40,
                      top: 100,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: kDarkGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 72),
                      child: Column(
                        children: [
                          Consumer<CheckoutProvider>(
                            builder: (context, val, _) => Expanded(
                              child: ListView.builder(
                                itemCount: val.list.length,
                                itemBuilder: (context, index) {
                                  return CardCheckoutProduct(
                                    productCheckout: val.list[index],
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding / 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding / 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      offset: const Offset(3, 3))
                                ]),
                            child: Consumer<CheckoutProvider>(
                                builder: (context, provider, child) {
                              if (provider.isBsu) {
                                return Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Keterangan",
                                          style: kDarkGrayText.copyWith(
                                              fontWeight: reguler,
                                              fontSize: 11),
                                        ),
                                        TBTextFieldWithBorder(
                                          controller: controllerNote,
                                          hintText: "Masukan Keterangan",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: kBlackText.copyWith(
                                              fontSize: 11, fontWeight: light),
                                        ),
                                        Text(
                                          FormatterExt()
                                              .currencyFormatter
                                              .format(provider.totalPrice),
                                          style: kGreenText.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Checkbox(
                                                value: provider.isShowDiscount,
                                                activeColor: kDarkGreen,
                                                onChanged: (val) {
                                                  provider
                                                      .showCuttOf(val ?? false);
                                                  if (provider
                                                          .isShowAdditional &&
                                                      val == true) {
                                                    provider.showAditional(
                                                        false,
                                                        isFromDiscount: true);
                                                  }
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: kDefaultPadding / 3,
                                            ),
                                            Text(
                                              "Pemotongan",
                                              style: kBlackText.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: light),
                                            ),
                                          ],
                                        ),
                                        provider.isShowDiscount
                                            ? TBTextFieldWithFormatter(
                                                controller: controller,
                                                callback: (val) {
                                                  if (val.isNotEmpty) {
                                                    String newVal =
                                                        val.replaceAll(".", "");
                                                    provider.onChangeDiscount(
                                                        double.parse(newVal));
                                                  } else {
                                                    provider
                                                        .onChangeDiscount(0);
                                                  }
                                                },
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Checkbox(
                                                value:
                                                    provider.isShowAdditional,
                                                activeColor: kDarkGreen,
                                                onChanged: (val) {
                                                  provider.showAditional(
                                                      val ?? false);
                                                  if (provider.isShowDiscount &&
                                                      val == true) {
                                                    provider.showCuttOf(false,
                                                        isFromAddtional: true);
                                                  }
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: kDefaultPadding / 3,
                                            ),
                                            Text(
                                              "Biaya Penambahan",
                                              style: kBlackText.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: light),
                                            ),
                                          ],
                                        ),
                                        provider.isShowAdditional
                                            ? TBTextFieldWithFormatter(
                                                controller:
                                                    controllerAdditional,
                                                callback: (val) {
                                                  if (val.isNotEmpty) {
                                                    String newVal =
                                                        val.replaceAll(".", "");
                                                    provider
                                                        .onChangeAddAditionl(
                                                            double.parse(
                                                                newVal));
                                                  } else {
                                                    provider
                                                        .onChangeAddAditionl(0);
                                                  }
                                                },
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Tagihan",
                                          style: kBlackText.copyWith(
                                              fontSize: 11, fontWeight: light),
                                        ),
                                        Text(
                                          FormatterExt()
                                              .currencyFormatter
                                              .format(provider.totalPayment),
                                          style: kGreenText.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Estimasi Total",
                                      style: kBlackText.copyWith(
                                          fontSize: 11, fontWeight: light),
                                    ),
                                    Text(
                                      FormatterExt()
                                          .currencyFormatter
                                          .format(provider.totalPrice),
                                      style: kGreenText.copyWith(
                                          fontWeight: semiBold),
                                    ),
                                  ],
                                );
                              }
                            }),
                          ),
                          Consumer<CheckoutProvider>(
                            builder: (context, provider, child) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                  vertical: kDefaultPadding),
                              child: provider.state == RequestState.loading
                                  ? const LoadingButton(
                                      height: 40, width: double.infinity)
                                  : TBButtonPrimaryWidget(
                                      buttonName: provider.isBsu
                                          ? "Tukarkan"
                                          : "Kembali",
                                      isDisable: provider.list.isEmpty,
                                      onPressed: () async {
                                        if (provider.isBsu) {
                                          String note = controllerNote.text;
                                          bool isHaveAdditional =
                                              provider.isShowAdditional;
                                          bool isHaveDiscount =
                                              provider.isShowDiscount;
                                          double additionalVal =
                                              provider.additional;
                                          double discount = provider.discount;
                                          var date = DateTime.now();
                                          if (note.isNotEmpty) {
                                            final f = DateFormat('yyyy-MM-dd');
                                            String transactionDate =
                                                f.format(date);
                                            String transactionEndDate =
                                                f.format(DateTime(date.year,
                                                    date.month + 1, date.day));
                                            var request = CheckoutRequest(
                                                transactionDate:
                                                    transactionDate,
                                                transactionEndDate:
                                                    transactionEndDate,
                                                note: note,
                                                pemotongan:
                                                    isHaveDiscount ? "Y" : "T",
                                                diskonPemotongan: isHaveDiscount
                                                    ? discount.toString()
                                                    : "0",
                                                penambahan: isHaveAdditional
                                                    ? "Y"
                                                    : "T",
                                                biayaPenambahan:
                                                    isHaveAdditional
                                                        ? additionalVal
                                                            .toString()
                                                        : "0",
                                                totalTagihan: provider
                                                    .totalPayment
                                                    .toString(),
                                                idSampah: provider.ids,
                                                kuantitas: provider.quantities,
                                                harga: provider.prices);
                                            await provider.checkout(
                                                request,
                                                widget.nasabahBSUModel
                                                        ?.idUserNasabah ??
                                                    "0");
                                            if (!mounted) return;
                                            if (provider.state ==
                                                RequestState.loaded) {
                                              SnackbarMessage.showToast(
                                                  "Data berhasil disimpan");
                                              provider.clearCart();
                                              context.go(MainPage.routeName);
                                            }
                                            if (provider.state ==
                                                RequestState.error) {
                                              SnackbarMessage.showToast(
                                                  provider.message);
                                              context.go(MainPage.routeName);
                                            }
                                          } else {
                                            SnackbarMessage.showSnackbar(
                                                context,
                                                "silahkan isi keterangan terlebih dahulu");
                                          }
                                        } else {
                                          context.pop();
                                        }
                                      },
                                      height: 40,
                                      width: double.infinity,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
