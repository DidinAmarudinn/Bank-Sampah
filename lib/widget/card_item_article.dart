// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/html_tag_remover.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feature/activity/model/activity_model.dart';
import '../feature/activity/ui/detail_activity_screen.dart';

class CardItemArticle extends StatelessWidget {
  final double height;
  final double width;
  final Activty? activityModel;

  const CardItemArticle({
    Key? key,
    required this.height,
    required this.width,
    this.activityModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kDefaultPadding),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push(DetailActivityScreen.routeName, extra: activityModel);
        },
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(kDefaultPadding / 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: activityModel?.pathImage ?? "",
                  height: height / 2,
                  width: width,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Text("Gambar Error"),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activityModel?.judulArtikel ?? "",
                      style: kBlackText.copyWith(fontWeight: semiBold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 6,
                    ),
                    Text(
                      parseHtmlString(activityModel?.isiArtikel ?? ""),
                      style:
                          kDarkGrayText.copyWith(fontWeight: light, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    (activityModel?.waktuKegiatan ?? "").isEmpty
                        ? const SizedBox()
                        : Text(
                            "${activityModel?.tempatKegiatan} (${activityModel?.waktuKegiatan})",
                            style: kDarkGrayText.copyWith(
                                fontWeight: semiBold, fontSize: 12),
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
