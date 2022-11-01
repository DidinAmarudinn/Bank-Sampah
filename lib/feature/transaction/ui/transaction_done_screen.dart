import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/card_last_transaction.dart';
import '../../dashboard/model/transaction_model.dart';
import '../provider/transaction_provider.dart';

class TransactionDone extends StatelessWidget {
  const TransactionDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, _) => PagedListView<int, TransactionResult>(
        pagingController: provider.pagingController,
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
    );
  }
}
