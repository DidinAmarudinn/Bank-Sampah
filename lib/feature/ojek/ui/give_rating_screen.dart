import 'package:bank_sampah/feature/ojek/model/give_rating_request.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/request_state_enum.dart';
import '../../../widget/loading_button.dart';
import '../../../widget/tb_button_primary_widget.dart';
import '../../../widget/tb_textfield_border.dart';

class GiveRatingScreen extends StatefulWidget {
  static const routeName = "/give-rating-page";
  const GiveRatingScreen({super.key});

  @override
  State<GiveRatingScreen> createState() => _GiveRatingScreenState();
}

class _GiveRatingScreenState extends State<GiveRatingScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OjekProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
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
                      padding: const EdgeInsets.only(
                          top: 50,
                          left: kDefaultPadding,
                          right: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Beri rating ke driver?",
                              style: kBlackText.copyWith(
                                  fontSize: 16, fontWeight: bold),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Center(
                              child: RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              provider.changeRating(rating);
                            },
                          )),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Id Pemesanan",
                                      style: kBlackText,
                                    ),
                                    Text(
                                      "22 Oktober 2022",
                                      style: kBlackText,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: kDefaultPadding * 3,
                                ),
                                TBTextFieldWithBorder(
                                  controller: controller,
                                  hintText: "Masukan ulasanmu disini",
                                  maxLines: 4,
                                ),
                                provider.state == RequestState.loading
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: kDefaultPadding),
                                        child: LoadingButton(
                                          height: 40,
                                          width: double.infinity,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: kDefaultPadding),
                                        child: TBButtonPrimaryWidget(
                                          buttonName: "Kirim",
                                          onPressed: () async {
                                            GiveRatingRequest? request =
                                                GiveRatingRequest(
                                              idTransaksi: "",
                                              idNasabah: provider.idNasabah,
                                              nilai: provider.rating.toString(),
                                              komentar: controller.text,
                                            );
                                            await provider.giveRating(request);
                                            if (!mounted) return;
                                            if (provider.state ==
                                                RequestState.loaded) {
                                              SnackbarMessage.showSnackbar(
                                                  context,
                                                  "Berhasil memberikan penilaian");
                                            }
                                            if (provider.state ==
                                                RequestState.error) {
                                              SnackbarMessage.showSnackbar(
                                                  context,
                                                  "Gagal memberikan penilaian");
                                            }
                                          },
                                          height: 40,
                                          width: double.infinity,
                                        ),
                                      ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
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
