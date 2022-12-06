import 'dart:async';

import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/feature/ojek/model/order_ojek_request.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/user_available_address/result_available_address_model.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/card_item_user_address.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/loading_button.dart';
import '../../../widget/tb_button_primary_widget.dart';
import '../../ojek/ui/detail_ojek_sampah_screen.dart';

class SelectAddressScreen extends StatefulWidget {
  static const routeName = "/select-address-page";
  final OrderOjekRequest? orderOjekRequest;
  const SelectAddressScreen({Key? key, this.orderOjekRequest})
      : super(key: key);

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AddressProvider>(context, listen: false).getUserAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: CustomAppBar(
            isHaveShadow: true,
            titlePage: "Atur Lokasi Penjemputan",
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Expanded(
                  child:
                      Consumer<OjekProvider>(builder: (context, provider, _) {
                    if (provider.state == RequestState.loading) {
                      return const Center(
                        child: SpinKitFadingCircle(
                          size: 50,
                          color: kDarkGreen,
                        ),
                      );
                    } else if (provider.state == RequestState.loaded) {
                      return ListView.builder(
                        itemCount:
                            (provider.dataBukuAlamat?.result?.length ?? 0) + 1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        itemBuilder: (context, index) {
                          if (index ==
                              provider.dataBukuAlamat?.result?.length) {
                            return Column(
                              children: [
                                (provider.dataBukuAlamat?.result?.isEmpty ??
                                        false)
                                    ? Padding(
                                        padding: const EdgeInsets.all(
                                            kDefaultPadding),
                                        child: Text(
                                          "Tidak ada alamat yang tersedia, untuk kelurahan layanan Jasa Angkut yang anda pilih",
                                          style: kBlackText.copyWith(
                                            fontSize: 14,
                                            fontWeight: semiBold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 3),
                                  child: CardItemUserAddress(
                                    imageName: kIcCircleMarker,
                                    title: "Gunakan Lokasi Lain",
                                    onTap: () {
                                      context.push(AddAddressScreen.routeName);
                                    },
                                    desc:
                                        "Pilih Lokasi Lain Atau Tambah Lokasi Baru",
                                  ),
                                ),
                              ],
                            );
                          } else {
                            var data = provider.dataBukuAlamat?.result?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding / 3),
                              child: CardItemUserAddress(
                                imageName: kIcMap,
                                onTap: () {
                                  provider.selectAddress(index);
                                },
                                isSelected: provider.selectedIndex == index,
                                title: data?.namaAlamat ?? "",
                                desc: data?.alamatLengkap ?? "",
                              ),
                            );
                          }
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
                Consumer<OjekProvider>(
                  builder: (context, provider, _) => provider.state ==
                          RequestState.loading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                              horizontal: kDefaultPadding),
                          child: LoadingButton(
                            height: 40,
                            width: double.infinity,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Harga: ${FormatterExt().currencyFormatter.format(double.parse(provider.ojekPrice))}",
                                style: kBlackText.copyWith(
                                    fontSize: 14, fontWeight: semiBold),
                              ),
                              const SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              TBButtonPrimaryWidget(
                                buttonName: "Pesan Ojek",
                                isDisable:
                                    (provider.dataBukuAlamat?.result?.isEmpty ??
                                            false) ||
                                        provider.ojekPrice == "0",
                                onPressed: () async {
                                  List<ResultAvailableAddressModel>?
                                      listAddress =
                                      provider.dataBukuAlamat?.result ?? [];
                                  int index = provider.selectedIndex;
                                  await provider.orderOjek(
                                      widget.orderOjekRequest?.copyWith(
                                          idBukuAlamat: listAddress[index].id,
                                          detailAlamat:
                                              listAddress[index].detailAlamat));
                                  if (!mounted) return;
                                  if (provider.state == RequestState.loaded) {
                                    SnackbarMessage.showToast(
                                        "Berhasil melakukan pemesanan Jasa Angkut");
                                        
                                    context.push(
                                        DetailOjekSampahScreen.routeName,
                                        extra: provider.idTransaksi.toString());
                                  }
                                  if (provider.state == RequestState.error) {
                                    SnackbarMessage.showToast(provider.message);
                                  }
                                },
                                height: 40,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
