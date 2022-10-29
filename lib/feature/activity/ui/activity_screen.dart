import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/provider/activity_provider.dart';
import 'package:bank_sampah/feature/activity/ui/detail_activity_screen.dart';
import 'package:bank_sampah/widget/custom_slider_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
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
                        right: 24,
                        top: 24,
                        child: Image.asset(
                          kIcNotification,
                          width: 40,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 72, left: kDefaultPadding),
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
                              } else if (value.state == RequestState.loading) {
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
                          Expanded(
                            child: Consumer<ActivityProvider>(
                              builder: (context, provider, _) =>
                                  PagedListView<int, Activty>(
                                pagingController: provider.pagingController,
                                builderDelegate:
                                    PagedChildBuilderDelegate<Activty>(
                                  noItemsFoundIndicatorBuilder: (context) =>
                                      Center(
                                    child: Text(
                                      "Belum Ada Transaksi",
                                      style: kBlackText,
                                    ),
                                  ),
                                  itemBuilder: (context, item, index) {
                                    return InkWell(
                                      onTap: () {
                                        context.push(
                                            DetailActivityScreen.routeName,
                                            extra: item);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: item.pathImage ?? "",
                                          height: 120,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
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
