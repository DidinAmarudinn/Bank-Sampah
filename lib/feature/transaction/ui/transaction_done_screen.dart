import 'package:flutter/material.dart';

import '../../../widget/card_last_transaction.dart';

class TransactionDone extends StatelessWidget {
  const TransactionDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const CardLastTransaction();
      },
    );
  }
}
