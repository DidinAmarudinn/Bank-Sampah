import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/feature/transaction/ui/bottomsheet_filter_transaction.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_done_screen.dart';
import 'package:bank_sampah/feature/transaction/ui/transaction_on_progress.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
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
                                    provider.changeTabBar(true);
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
                                        color: provider.isOnProgress
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
                                    provider.changeTabBar(false);
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
                                        color: provider.isOnProgress
                                            ? Colors.white.withOpacity(0)
                                            : kDarkGreen,
                                      ),
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
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding / 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 12,
                                              offset: const Offset(3, 3))
                                        ]),
                                    width: double.infinity,
                                    child: TextField(
                                      controller: searchController,
                                      decoration: const InputDecoration(
                                        hintText: "Cari Transaksi",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: kDefaultPadding / 2,
                                ),
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
                                          return Wrap(children: const [
                                            BottomSheetFilterTransaction()
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
                              child: provider.isOnProgress
                                  ? const TransactionOnProgress()
                                  : const TransactionDone()),
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
