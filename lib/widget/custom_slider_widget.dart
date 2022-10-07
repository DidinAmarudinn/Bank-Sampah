import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/ui/home_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSliderWidget extends StatelessWidget {
  final double height;
  final bool? isFullFraction;
  final List<SliderModel?> list;

  const CustomSliderWidget({
    Key? key,
    required this.height,
    this.isFullFraction,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, _) => Column(
        children: [
          CarouselSlider(
            items: list
                .map((e) => Container(
                      height: height,
                      margin: EdgeInsets.only(
                          right:
                              isFullFraction ?? true ? 0 : kDefaultPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: e?.pathImage ?? "",
                          fit: BoxFit.cover ,
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Text(error.toString()),
                            );
                          },
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                autoPlay: true,
                height: height,
                viewportFraction: isFullFraction ?? true ? 1 : 0.95,
                onPageChanged: (index, reason) {
                  value.changeSliderIndex(index);
                }),
          ),
          const SizedBox(
            height: kDefaultPadding / 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return Container(
                width: value.currentIndex == entry.key ? 14 : 8,
                height: 8,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color:
                        value.currentIndex == entry.key ? kGreen : kGreyColor),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
