import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/feature/nasabah/ui/nasabah_screen.dart';
import 'package:bank_sampah/feature/ojek/ui/detail_ojek_sampah_screen.dart';
import 'package:bank_sampah/feature/transaction/ui/detail_transaction_pembelian_nasabah.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/circle_menu_widget.dart';
import 'package:bank_sampah/widget/custom_slider_widget.dart';
import 'package:bank_sampah/widget/poin_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/card_last_transaction.dart';
import '../../bsu/ui/detail_transaction_bsu_screen.dart';
import '../provider/home_page_provider.dart';
import '../provider/main_page_provider.dart';
import 'bottom_sheet_others_menu.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context, listen: false).getListSlider();
      Provider.of<HomePageProvider>(context, listen: false).getUserBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            provider.pagingController.refresh();
            provider.getUserBalance();
          },
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
                                      "Hello ${provider.fullName}!",
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
                            ],
                          ),
                          PoinCardWidget(
                            userBalance:
                                provider.userBalance?.result?.belumDibayar ??
                                    "",
                          ),
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
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding / 2,
                      kDefaultPadding,
                      kDefaultPadding / 2,
                      kDefaultPadding / 2),
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<MainPageProvider>(
                            builder: (context, provider, _) => CircleMenuWidget(
                              color: kPastelColor,
                              iconName: kIcCalculator,
                              menuName: "Kalkulator Sampah",
                              onTap: () {
                                if (provider.isBsu) {
                                  context.push(NasabahScreen.routeName);
                                } else {
                                  context.push(TrashCalculatorPage.routeName);
                                }
                              },
                            ),
                          ),
                          // CircleMenuWidget(
                          //   color: kDarkGreen,
                          //   iconName: kIcPuls,
                          //   menuName: "Pulsa",
                          //   onTap: () {
                          //     context.push(PulsaScreen.routeName);
                          //   },
                          // ),
                          // CircleMenuWidget(
                          //   color: kDarkGreen,
                          //   iconName: kIcListrik,
                          //   menuName: "Listrik",
                          //   onTap: () {
                          //     context.push(ListrikScreen.routeName);
                          //   },
                          // ),
                          // CircleMenuWidget(
                          //   color: kDarkGreen,
                          //   iconName: kIcPdam,
                          //   menuName: "Pdam",
                          //   onTap: () {
                          //     context.push(PDAMScreen.routeName);
                          //   },
                          // ),
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
                          const Spacer()
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Consumer<HomePageProvider>(
                        builder: ((context, value, child) {
                          if (value.sliderState == RequestState.loaded) {
                            return CustomSliderWidget(
                              height: 100,
                              list: value.listSlider ?? [],
                            );
                          } else if (value.sliderState ==
                              RequestState.loading) {
                            return const SizedBox(
                              height: 100,
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
                      )
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
                  "Transaksi Terakhir",
                  style: kDarkGrayText.copyWith(fontWeight: bold),
                ),
              ),
            ),
            PagedSliverList<int, TransactionResult>(
              pagingController: provider.pagingController,
              builderDelegate: PagedChildBuilderDelegate<TransactionResult>(
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Text(
                    "Belum Ada Transaksi",
                    style: kBlackText,
                  ),
                ),
                itemBuilder: (context, item, index) {
                  return InkWell(
                      onTap: () {
                        if (provider.isBsu) {
                          if (item.tipe == "pembelian" &&
                              item.jenis == "penimbangan") {
                            context.push(DetailTransactionBSUScreen.routeName,
                                extra: item.idTransaksi);
                          }

                          if (item.tipe == "pembelian" &&
                              item.jenis == "penagihan") {
                            context.push(DetailTransactionBSUScreen.routeName,
                                extra: item.idTransaksi);
                          }
                        } else {
                          if (item.tipe == "ojek_sampah") {
                            context.push(DetailOjekSampahScreen.routeName,
                                extra: item.idTransaksi);
                          }
                          if (item.jenis == "penagihan" &&
                              item.tipe == "pembelian") {
                            context.push(
                                DetailTransactionPembelianNasabahScreen
                                    .routeName,
                                extra: item.idTransaksi);
                          }
                        }
                      },
                      child: CardLastTransaction(transactionResult: item));
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: kDefaultPadding,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
