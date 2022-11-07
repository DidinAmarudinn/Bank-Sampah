import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/feature/transaction/ui/bottomsheet_filter_transaction.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_canceled.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_done_screen.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_on_progress.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../dashboard/model/transaction_model.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController searchController = TextEditingController();
  final PagingController<int, TransactionResult> _pagingController =
      PagingController(firstPageKey: 0);
  final PagingController<int, TransactionResult> _pagingControllerCanceled =
      PagingController(firstPageKey: 0);
  final PagingController<int, TransactionResult> _pagingControllerDone =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TransactionProvider>(context, listen: false).changeTabBar(0);
    });
    _pagingController.addPageRequestListener((pageKey) {
      Provider.of<TransactionProvider>(context, listen: false)
          .getListTransactionOnProgress(pageKey, null, _pagingController);
    });
    _pagingControllerDone.addPageRequestListener((pageKey) {
      Provider.of<TransactionProvider>(context, listen: false)
          .getListTransaction(pageKey, null, _pagingControllerDone);
    });
    _pagingControllerCanceled.addPageRequestListener((pageKey) {
      Provider.of<TransactionProvider>(context, listen: false)
          .getListTransactionCanceled(pageKey, null, _pagingControllerCanceled);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _pagingControllerCanceled.dispose();
    _pagingControllerDone.dispose();
    print("dispose called");
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Text(
                        "Catatan Transaksi",
                        style: kBlackText.copyWith(
                          fontWeight: bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
                      padding: const EdgeInsets.only(top: 72),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.changeTabBar(0);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Dalam Proses",
                                        style: kBlackText.copyWith(
                                            fontWeight: semiBold),
                                      ),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: 4,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding),
                                        width: double.infinity,
                                        color: provider.index == 0
                                            ? kDarkGreen
                                            : Colors.white.withOpacity(0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.changeTabBar(1);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Selesai",
                                        style: kBlackText.copyWith(
                                            fontWeight: semiBold),
                                      ),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: 4,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding),
                                        width: double.infinity,
                                        color: provider.index == 1
                                            ? kDarkGreen
                                            : Colors.white.withOpacity(0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.changeTabBar(2);
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Dibatalkan",
                                        style: kBlackText.copyWith(
                                            fontWeight: semiBold),
                                      ),
                                      AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          height: 4,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: kDefaultPadding),
                                          width: double.infinity,
                                          color: provider.index == 2
                                              ? kDarkGreen
                                              : Colors.white.withOpacity(0)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Row(
                              children: [
                                InkWell(
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
                                          return Wrap(children: [
                                            BottomSheetFilterTransaction(
                                              isOnProgress: provider.index == 0,
                                              isCanceled: provider.index == 2,
                                              onSaveFilterOnProgress: () {
                                                _pagingController.refresh();
                                              },
                                              onSaveCanceled: () {},
                                              onSaveDone: () {},
                                            )
                                          ]);
                                        });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 12,
                                            offset: const Offset(3, 3))
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.filter_alt_outlined,
                                          color: kDarkGreen,
                                        ),
                                        Text(
                                          "Filter",
                                          style: kGreenText.copyWith(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Expanded(
                            child: provider.index == 0
                                ? TransactionOnProgress(
                                    pagingController: _pagingController,
                                  )
                                : provider.index == 1
                                    ? TransactionDone(
                                        pagingController: _pagingControllerDone,
                                      )
                                    : TransactionCanceled(
                                        pagingController:
                                            _pagingControllerCanceled,
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
