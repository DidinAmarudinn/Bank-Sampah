import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/provider/activity_provider.dart';
import 'package:bank_sampah/widget/card_item_article.dart';
import 'package:bank_sampah/widget/custom_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';
import '../../../utils/request_state_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    Provider.of<ActivityProvider>(context, listen: false).start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ActivityProvider>(context, listen: false).getListSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    Positioned(
                        left: 24,
                        top: 24,
                        child: Text(
                          "Edukasi",
                          style: kBlackText.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 72, left: kDefaultPadding),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<ActivityProvider>(
                              builder: ((context, value, child) {
                                if (value.state == RequestState.loaded) {
                                  return CustomSliderWidget(
                                    height: 180,
                                    list: value.listSlider ?? [],
                                  );
                                } else if (value.state ==
                                    RequestState.loading) {
                                  return const SizedBox(
                                    height: 180,
                                    width: double.infinity,
                                    child: Center(
                                      child: SpinKitFadingCircle(
                                        size: 40,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding),
                              child: Text(
                                "Kegiatan Kami",
                                style: kGreenText.copyWith(
                                    fontWeight: bold, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.6,
                              child: Consumer<ActivityProvider>(
                                builder: (context, provider, _) =>
                                    PagedListView<int, Activty>(
                                  scrollDirection: Axis.horizontal,
                                  pagingController: provider.pagingController,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<Activty>(
                                    noItemsFoundIndicatorBuilder: (context) =>
                                        Center(
                                      child: Text(
                                        "Belum Ada Kegiatan",
                                        style: kBlackText,
                                      ),
                                    ),
                                    itemBuilder: (context, item, index) {
                                      return CardItemArticle(
                                        height: size.width * 0.6,
                                        width: size.width * 0.7,
                                        activityModel: item,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding),
                              child: Text(
                                "Artikel",
                                style: kGreenText.copyWith(
                                    fontWeight: bold, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.6,
                              child: Consumer<ActivityProvider>(
                                builder: (context, provider, _) =>
                                    PagedListView<int, Activty>(
                                  scrollDirection: Axis.horizontal,
                                  pagingController:
                                      provider.pagingControllerArticle,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<Activty>(
                                    noItemsFoundIndicatorBuilder: (context) =>
                                        Center(
                                      child: Text(
                                        "Belum Ada Artikel",
                                        style: kBlackText,
                                      ),
                                    ),
                                    itemBuilder: (context, item, index) {
                                      return CardItemArticle(
                                        height: size.width * 0.6,
                                        width: size.width * 0.7,
                                        activityModel: item,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                            )
                          ],
                        ),
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
