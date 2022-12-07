import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../widget/card_last_transaction.dart';
import '../../bsu/ui/detail_transaction_bsu_screen.dart';
import '../../dashboard/model/transaction_model.dart';
import '../../ojek/ui/detail_ojek_sampah_screen.dart';
import '../provider/transaction_provider.dart';
import 'detail_transaction_pembelian_nasabah.dart';
import 'detail_transaction_ppob.dart';

class TransactionCanceled extends StatefulWidget {
  final PagingController<int, TransactionResult> pagingController;
  const TransactionCanceled({Key? key, required this.pagingController})
      : super(key: key);

  @override
  State<TransactionCanceled> createState() => _TransactionCanceledState();
}

class _TransactionCanceledState extends State<TransactionCanceled> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<TransactionProvider, HomePageProvider>(
      builder: (context, provider, homeProvider, _) => RefreshIndicator(
        onRefresh: () async {
          widget.pagingController.refresh();
        },
        child: PagedListView<int, TransactionResult>(
          pagingController: widget.pagingController,
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
                    if (homeProvider.isBsu) {
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
                      if (item.tipe?.toLowerCase() == "ppob") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailTransactionPPOB(
                                      result: item,
                                    )));
                      }
                    } else {
                      if (item.tipe == "ojek_sampah") {
                        context.push(DetailOjekSampahScreen.routeName,
                            extra: item.idTransaksi);
                      }
                      if (item.jenis == "penagihan" &&
                          item.tipe == "pembelian") {
                        context.push(
                            DetailTransactionPembelianNasabahScreen.routeName,
                            extra: item.idTransaksi);
                      }
                      if (item.tipe?.toLowerCase() == "ppob") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailTransactionPPOB(
                                      result: item,
                                    )));
                      }
                    }
                  },
                  child: CardLastTransaction(transactionResult: item));
            },
          ),
        ),
      ),
    );
  }
}
