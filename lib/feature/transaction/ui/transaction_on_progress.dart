import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../widget/card_last_transaction.dart';
import '../../dashboard/model/transaction_model.dart';
import '../provider/transaction_provider.dart';

class TransactionOnProgress extends StatefulWidget {
  const TransactionOnProgress({Key? key}) : super(key: key);

  @override
  State<TransactionOnProgress> createState() => _TransactionOnProgressState();
}

class _TransactionOnProgressState extends State<TransactionOnProgress> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, _) => RefreshIndicator(
        onRefresh: () async {
          provider.pagingControllerOnProgress.refresh();
        },
        child: PagedListView<int, TransactionResult>(
          pagingController: provider.pagingControllerOnProgress,
          builderDelegate: PagedChildBuilderDelegate<TransactionResult>(
            noItemsFoundIndicatorBuilder: (context) => Center(
              child: Text(
                "Belum Ada Transaksi",
                style: kBlackText,
              ),
            ),
            itemBuilder: (context, item, index) {
              return CardLastTransaction(transactionResult: item);
            },
          ),
        ),
      ),
    );
  }
}
