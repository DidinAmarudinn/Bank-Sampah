import 'package:bank_sampah/feature/address/ui/select_address_screen.dart';
import 'package:bank_sampah/feature/ojek/model/ojek_model.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/item_day_pickup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';
import '../../../widget/tb_button_primary_widget.dart';

class OjekScreen extends StatefulWidget {
  static const routeName = '/ojek-page';
  final bool isDaily;
  const OjekScreen({Key? key, required this.isDaily}) : super(key: key);

  @override
  State<OjekScreen> createState() => _OjekScreenState();
}

class _OjekScreenState extends State<OjekScreen> {
  @override
  void initState() {
    Provider.of<OjekProvider>(context, listen: false).clearData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            child: CustomAppBar(
              titlePage: widget.isDaily
                  ? "Ojek Sampah Harian"
                  : "Ojek Sampah Berlangganan",
              isHaveShadow: true,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  width: 40,
                  decoration: BoxDecoration(
                    color: widget.isDaily ? kDarkGreen : kGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(kIcMotor),
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding / 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.isDaily
                          ? "Ojek Sampah"
                          : "Ojek Sampah Berlangganan ",
                      style: kGreenText.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      widget.isDaily
                          ? "Ojek Sampah Dalam Sekali Pesan"
                          : "Pelayanan Ojek Jemput Berkala Sesuai Jadwal",
                      style:
                          kGreyText.copyWith(fontSize: 12, fontWeight: light),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
            color: kBorderGray,
            child: Text(
              widget.isDaily
                  ? "Pilih Tanggal Penjemputan"
                  : "Pilih hari penjemputan",
              style: kBlackText.copyWith(fontSize: 12, fontWeight: bold),
            ),
          ),
          Expanded(
            child: widget.isDaily
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Consumer<OjekProvider>(
                          builder: (context, provider, _) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${FormatterExt().dateFormat.format(provider.time)}, ${FormatterExt().weekdayName[provider.time.weekday]}",
                                style:
                                    kBlackText.copyWith(fontWeight: semiBold),
                              ),
                              TBButtonPrimaryWidget(
                                  buttonName: "Pilih Tanggal",
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      cancelText: "Tutup",
                                      helpText: "Pilih Tanggal Penjemputan",
                                      confirmText: "Pilih",
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2099),
                                    ).then((value) {
                                      provider.selectedTime(value ?? DateTime.now());
                                    });
                                  },
                                  height: 40,
                                  width: 120)
                            ],
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  )
                : Consumer<OjekProvider>(
                    builder: (context, value, _) => ListView.builder(
                      itemCount: dayPickUpData.length,
                      itemBuilder: (context, index) {
                        String day = dayPickUpData[index];
                        return ItemDayPickup(
                            titile: day,
                            isChecked: value.isChecked(day),
                            onCheck: (newVal) {
                              if (newVal == true) {
                                value.selectDays(day);
                              } else {
                                value.removeDays(day);
                              }
                            });
                      },
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            child: TBButtonPrimaryWidget(
              buttonName: "Simpan",
              onPressed: () {
                context.push(SelectAddressScreen.routeName);
              },
              height: 40,
              width: double.infinity,
            ),
          ),
        ],
      )),
    );
  }
}
