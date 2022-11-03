import 'package:bank_sampah/feature/bsu/provider/bsu_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/card_transaction_bsu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class PenjualanBSUScreen extends StatefulWidget {
  const PenjualanBSUScreen({super.key});

  @override
  State<PenjualanBSUScreen> createState() => _PenjualanBSUScreenState();
}

class _PenjualanBSUScreenState extends State<PenjualanBSUScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BSUProvider>(builder: (context, provider, _) {
      if (provider.state == RequestState.loading) {
        return const Center(
          child: SpinKitFadingCircle(
            size: 40,
            color: kDarkGreen,
          ),
        );
      } else if (provider.state == RequestState.loaded) {
        return ListView.builder(
            itemCount: provider.listPenagihan.length,
            itemBuilder: (context, index) {
              var data = provider.listPenagihan[index];
              return CardTransactionBSU(
                id: data.idTransaksi ?? "",
                status: data.status ?? "",
                tglTransaksi: data.tglTransaksi ?? "",
                totalTagihan: data.totalTagihan ?? "",
              );
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
