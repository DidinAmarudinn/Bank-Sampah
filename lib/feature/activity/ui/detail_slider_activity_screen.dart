import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../themes/constants.dart';

class DetailSliderActiviyScreen extends StatefulWidget {
  final SliderModel? sliderModel;
  static const routeName = "/detail-slider-activity-page";
  const DetailSliderActiviyScreen({Key? key, required this.sliderModel})
      : super(key: key);

  @override
  State<DetailSliderActiviyScreen> createState() => _DetailActiviyScreenState();
}

class _DetailActiviyScreenState extends State<DetailSliderActiviyScreen> {
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
                              widget.sliderModel?.title ?? "",
                              style: kGreenText.copyWith(
                                  fontSize: 16, fontWeight: bold),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding * 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: 130,
                                
                                  imageUrl: widget.sliderModel?.pathImage ?? "",
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) {
                                    return const Text(
                                      "Image Error",
                                    );
                                  },
                                ),
                              )),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Text(
                              widget.sliderModel?.caption ?? "",
                              style: kDarkGrayText.copyWith(
                                height: 1.5,
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
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
