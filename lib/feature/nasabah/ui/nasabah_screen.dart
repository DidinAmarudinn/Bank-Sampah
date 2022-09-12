import 'package:bank_sampah/feature/nasabah/model/nasabah_model.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';

import '../../../themes/constants.dart';
import '../../../widget/custom_app_bar.dart';

class NasabahScreen extends StatefulWidget {
  static const routeName = "/nasabah-page";
  const NasabahScreen({Key? key}) : super(key: key);

  @override
  State<NasabahScreen> createState() => _NasabahScreenState();
}

class _NasabahScreenState extends State<NasabahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: CustomAppBar(
                  titlePage: "Data Nasabah",
                  isHaveShadow: true,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Pilih Nasabah",
                style: kDarkGrayText.copyWith(fontWeight: semiBold),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyNasabahData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(bottom: kDefaultPadding / 2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset:const Offset(0,2)
                        )]
                      ),
                      child: Text(
                        dummyNasabahData[index],
                        style: kDarkGrayText.copyWith(
                            fontWeight: semiBold, fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: TBButtonPrimaryWidget(
                  buttonName: "+ Tambah Data Nasabah",
                  onPressed: () {},
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
