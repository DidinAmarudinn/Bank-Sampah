import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';
import '../../../widget/tb_textfield_border.dart';

class AddAddressScreen extends StatefulWidget {
  static const routeName = "/add-address-page";
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerVilage = TextEditingController();
  final TextEditingController controllerDetailAddress = TextEditingController();
  late BitmapDescriptor icon;

  final markers = <Marker>{};
  MarkerId markerId = const MarkerId("newLocation");
  LatLng latLng = const LatLng(-6.9003069, 107.6187099);
  @override
  void initState() {
    markers.add(
      Marker(
        markerId: markerId,
        position: latLng,
      ),
    );
    getIcons();
    super.initState();
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(12, 12)), kIcMarker);
    setState(() {
      this.icon = icon;
    });
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
                              "Nama",
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
                            ),
                            TBTextFieldWithBorder(
                                controller: controllerName,
                                hintText: "Masukan Nama Penerima"),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              "Alamat",
                              style:
                                  kDarkGrayText.copyWith(fontWeight: semiBold),
                            ),
                            TBTextFieldWithBorder(
                              controller: controllerVilage,
                              hintText: "Masukan Kelurahan",
                            ),
                            TBTextFieldWithBorder(
                              controller: controllerDetailAddress,
                              hintText: "Masukan Alamat Lengkap",
                              maxLines: 4,
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(-6.9003069, 107.6187099),
                                zoom: 14),
                            onMapCreated: (GoogleMapController controller) {},
                            onCameraMove: (position) {
                              setState(() {
                                markers.add(Marker(
                                    markerId: markerId,
                                    icon: BitmapDescriptor.defaultMarkerWithHue(146),
                                    position: position.target));
                              });
                            },
                            markers: markers),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 2),
                        child: Text(
                            "Atur titik pada peta  sesuai lokasi yang anda inginkan",
                            style: kLightGrayText.copyWith(fontSize: 12)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
                child: TBButtonPrimaryWidget(
                  buttonName: "Simpan",
                  isDisable: false,
                  onPressed: () {
                    print(markers.last.position.latitude);
                  },
                  height: 40,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
