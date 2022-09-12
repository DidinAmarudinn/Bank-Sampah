import 'package:bank_sampah/feature/activity/ui/detail_activity_screen.dart';
import 'package:bank_sampah/widget/custom_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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
                          const CustomSliderWidget(
                            height: 180,
                            isFullFraction: false,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                            child: Text("Kegiatan Kami", style: kGreenText.copyWith(fontWeight: bold,fontSize: 16),),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: (){
                                    context.push(DetailActiviyScreen.routeName);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: kDefaultPadding / 2,
                                        right: kDefaultPadding),
                                    height: 137,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
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
