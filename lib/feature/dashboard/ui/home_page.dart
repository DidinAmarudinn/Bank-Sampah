import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/circle_menu_widget.dart';
import 'package:bank_sampah/widget/custom_slider_widget.dart';
import 'package:bank_sampah/widget/poin_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/card_last_transaction.dart';
import 'bottom_sheet_others_menu.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
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
                    bottom: 0,
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
                    padding: const EdgeInsets.fromLTRB(
                        kDefaultPadding, 0, kDefaultPadding, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello Cecep!",
                                    style: kGreenText.copyWith(
                                        fontWeight: semiBold),
                                  ),
                                  Text(
                                    "Selamat datang di Bank Sampah Sorong Raya",
                                    style: kGreenText.copyWith(
                                      fontWeight: reguler,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              kIcNotification,
                              width: 40,
                            )
                          ],
                        ),
                        const PoinCardWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                padding: const EdgeInsets.fromLTRB(kDefaultPadding / 2,
                    kDefaultPadding, kDefaultPadding / 2, kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 4,
                      offset: const Offset(0, 5),
                    )
                  ],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CircleMenuWidget(
                          color: kPastelColor,
                          iconName: kIcCalculator,
                          menuName: "Kalkulator Sampah",
                          onTap: (){
                             context.push(TrashCalculatorPage.routeName);
                          },
                        ),
                        const CircleMenuWidget(
                          color: kDarkGreen,
                          iconName: kIcPuls,
                          menuName: "Pulsa",
                        ),
                        const CircleMenuWidget(
                          color: kDarkGreen,
                          iconName: kIcCalculator,
                          menuName: "Listrik",
                        ),
                        const CircleMenuWidget(
                          color: kDarkGreen,
                          iconName: kIcPdam,
                          menuName: "Pdam",
                        ),
                        CircleMenuWidget(
                          color: kLightGray,
                          iconName: kIcOthersMenu,
                          menuName: "Lainnya",
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return Wrap(children: const [
                                    BottomSheetOthersMenu()
                                  ]);
                                });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const CustomSliderWidget(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 15,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kLightGray,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Text(
                "Transaksi Terkahir",
                style: kDarkGrayText.copyWith(fontWeight: bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const CardLastTransaction();
            }, childCount: 12),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kDefaultPadding,
            ),
          ),
        ]),
      ),
    );
  }
}
