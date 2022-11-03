import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/request_state_enum.dart';
import '../../../widget/card_transaction_bsu.dart';
import '../provider/bsu_provider.dart';

class PenimbanganBSUScreen extends StatefulWidget {
  const PenimbanganBSUScreen({super.key});

  @override
  State<PenimbanganBSUScreen> createState() => _PenimbanganBSUScreenState();
}

class _PenimbanganBSUScreenState extends State<PenimbanganBSUScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BSUProvider>(builder: (context, provider, _) {
      if (provider.statePenimbangan == RequestState.loading) {
        return const Center(
          child: SpinKitFadingCircle(
            size: 40,
            color: kDarkGreen,
          ),
        );
      } else if (provider.statePenimbangan == RequestState.loaded) {
        return ListView.builder(
            itemCount: provider.listPenimbangan.length,
            itemBuilder: (context, index) {
              var data = provider.listPenimbangan[index];
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
