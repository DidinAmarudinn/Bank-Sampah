import 'dart:async';

import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/card_item_user_address.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../themes/constants.dart';
import '../../../widget/tb_button_primary_widget.dart';

class SelectAddressScreen extends StatefulWidget {
  static const routeName = "/select-address-page";
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.5,
            child: Stack(
              children: [
                SizedBox(
                  height: height * 0.5,
                  child: GoogleMap(
                    compassEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition:  const CameraPosition(
                          target:
                              LatLng(-6.9003069, 107.6187099), zoom: 16),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: <Marker>{
                      Marker(
                          markerId:const MarkerId("value"),
                          draggable: true,
                          position:
                            const LatLng(-6.9003069, 107.6187099),
                          onDragEnd: ((newPosition) {
                          }))
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: CustomAppBar(
                    titlePage: "",
                    isHaveShadow: true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGreyColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4)),
                ),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const CardItemUserAddress(
                      imageName: kIcMap,
                      title: "Cecep",
                      desc:
                          "Jl. Alfa I No.2 Cigadung Kecamatan Cibenying Kaler Kota Bandung - Jawabarat",
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    CardItemUserAddress(
                      imageName: kIcCircleMarker,
                      title: "Gunakan Lokasi Lain",
                      onTap: () {
                        context.push(AddAddressScreen.routeName);
                      },
                      desc: "Pilih Lokasi Lain Atau Tambah Lokasi Baru",
                    ),
                  ],
                )),
                SafeArea(
                  child: TBButtonPrimaryWidget(
                    buttonName: "Cari Ojek",
                    onPressed: () {},
                    height: 40,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
