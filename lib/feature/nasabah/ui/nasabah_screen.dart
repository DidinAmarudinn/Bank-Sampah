import 'package:bank_sampah/feature/nasabah/model/nasabah_model.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/nasabah/ui/add_nasabah_data_screen.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NasabahProvider>(context, listen: false).getListNasabahBSU();
    });
  }

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
                child:
                    Consumer<NasabahProvider>(builder: (context, provider, _) {
                  if (provider.stateListNasabah == RequestState.loaded) {
                    return ListView.builder(
                      itemCount: provider.nasabaBsuList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              bottom: kDefaultPadding / 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding / 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 12,
                                    offset: const Offset(0, 2))
                              ]),
                          child: Text(
                            provider.nasabaBsuList[index].namaNasabah ?? "",
                            style: kDarkGrayText.copyWith(
                                fontWeight: semiBold, fontSize: 12),
                          ),
                        );
                      },
                    );
                  } else if (provider.stateListNasabah ==
                      RequestState.loading) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: kDarkGreen,
                        size: 50,
                      ),
                    );
                  } else if (provider.stateListNasabah == RequestState.error) {
                    return Center(
                      child: Text(
                        provider.errorMessage,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: TBButtonPrimaryWidget(
                  buttonName: "+ Tambah Data Nasabah",
                  onPressed: () {
                    context.push(AddDataNasabahScreen.routeName);
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
