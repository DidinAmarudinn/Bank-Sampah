import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/provider/activity_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';

class DetailActivityScreen extends StatefulWidget {
  final Activty? activty;
  static const routeName = "/detail-activity-page";
  const DetailActivityScreen({super.key, this.activty});

  @override
  State<DetailActivityScreen> createState() => _DetailActivityScreenState();
}

class _DetailActivityScreenState extends State<DetailActivityScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ActivityProvider>(context, listen: false)
          .addCountOfView(int.parse(widget.activty?.idartikel ?? "0"));
    });
  }

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
                              widget.activty?.judulArtikel ?? "",
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
                                  imageUrl: widget.activty?.pathImage ?? "",
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
                            child: Column(
                              children: [
                                (widget.activty?.waktuKegiatan ?? "").isEmpty
                                    ? const SizedBox()
                                    : Text(
                                        "${widget.activty?.tempatKegiatan} (${widget.activty?.waktuKegiatan})",
                                        style: kDarkGrayText.copyWith(
                                            fontWeight: semiBold, fontSize: 12),
                                      ),
                                Html(
                                  data: widget.activty?.isiArtikel ?? "",
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
