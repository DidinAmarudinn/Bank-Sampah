import 'dart:async';

import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/card_item_user_address.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/tb_button_primary_widget.dart';

class SelectAddressScreen extends StatefulWidget {
  static const routeName = "/select-address-page";
  const SelectAddressScreen({Key? key}) : super(key: key);

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
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              child: Column(
                children: [
                  Expanded(
                    child: Consumer<AddressProvider>(
                        builder: (context, provider, _) {
                      if (provider.state == RequestState.loading) {
                        return const Center(
                          child: SpinKitFadingCircle(
                            size: 50,
                            color: kDarkGreen,
                          ),
                        );
                      } else if (provider.state == RequestState.loaded) {
                        return ListView.builder(
                          itemCount: provider.listUserAddress.length + 1,
                          itemBuilder: (context, index) {
                            if (index == provider.listUserAddress.length) {
                              return Padding(
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
                              );
                            } else {
                              var data = provider.listUserAddress[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 3),
                                child: CardItemUserAddress(
                                  imageName: kIcMap,
                                  onTap: () {
                                    provider.selectAddress(index);
                                  },
                                  isSelected: provider.selectedIndex == index,
                                  title: data.namaAlamat ?? "",
                                  desc: data.alamatLengkap ?? "",
                                ),
                              );
                            }
                          },
                        );
                      } else if (provider.state == RequestState.error) {
                        return Center(
                          child: TBButtonPrimaryWidget(
                            buttonName: "Coba Lagi",
                            height: 40,
                            width: double.infinity,
                            onPressed: () {
                              provider.getUserAddress();
                            },
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  TBButtonPrimaryWidget(
                    buttonName: "Cari Ojek",
                    onPressed: () {},
                    height: 40,
                    width: double.infinity,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
