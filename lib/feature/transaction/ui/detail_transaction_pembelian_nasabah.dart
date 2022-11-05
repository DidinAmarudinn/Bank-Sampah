import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/formatter_ext.dart';
import '../../../utils/request_state_enum.dart';
import '../../../widget/custom_app_bar.dart';

class DetailTransactionPembelianNasabahScreen extends StatefulWidget {
  final String id;
  static const routeName = "/detail-transaction-nasabah-page";
  const DetailTransactionPembelianNasabahScreen({super.key, required this.id});

  @override
  State<DetailTransactionPembelianNasabahScreen> createState() =>
      _DetailTransactionPembelianNasabahScreenState();
}

class _DetailTransactionPembelianNasabahScreenState
    extends State<DetailTransactionPembelianNasabahScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TransactionProvider>(context, listen: false)
          .getTransactionDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      body: provider.state == RequestState.loading
          ? const Center(
              child: SpinKitCircle(
              size: 40,
              color: kDarkGreen,
            ))
          : SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: CustomAppBar(
                    titlePage: provider.detailData?.transaksi?.jenis ?? "",
                    isHaveShadow: true,
                  ),
                ),
                _buildRow(
                  "Id Transaksi",
                  "#${provider.detailData?.transaksi?.idTransaksi ?? ""}",
                ),
                _buildRow(
                  "Total Tagihan",
                  FormatterExt().currencyFormatter.format(
                        int.parse(
                            provider.detailData?.transaksi?.totalTagihan ??
                                "0"),
                      ),
                ),
                _buildRow("Status Transaksi",
                    provider.detailData?.transaksi?.status ?? ""),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                provider.detailData?.detailPembayaran?.isEmpty ?? true
                    ? const SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Text(
                              "Pembayaran",
                              style: kBlackText.copyWith(fontWeight: semiBold),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                                padding: const EdgeInsets.only(
                                    left: kDefaultPadding),
                                scrollDirection: Axis.horizontal,
                                itemCount: provider
                                    .detailData?.detailPembayaran?.length,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  var data = provider
                                      .detailData?.detailPembayaran?[index];
                                  return Container(
                                    padding: const EdgeInsets.all(
                                        kDefaultPadding / 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            offset: const Offset(0, 3),
                                            spreadRadius: 3,
                                            blurRadius: 30,
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Id Pembayaran #${data?.idTransaksiPembayaran}"),
                                        Text(
                                            "Total Pembayaran ${data?.nominalTransaksi}"),
                                        Text("Status ${data?.status}"),
                                        Text(
                                            "Cara Pembayaran ${data?.namaCara}"),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2),
                  child: Text(
                    "Daftar Sampah",
                    style: kBlackText.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.detailData?.detailTransaksi?.length,
                    itemBuilder: (context, index) {
                      var data = provider.detailData?.detailTransaksi?[index];
                      return Container(
                        height: 80,
                        padding: const EdgeInsets.all(kDefaultPadding / 2),
                        margin: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                offset: const Offset(0, 3),
                                spreadRadius: 3,
                                blurRadius: 30,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kode Sampah ${data?.kodeSampah}",
                                  style:
                                      kBlackText.copyWith(fontWeight: semiBold),
                                ),
                                Text("Harga, ${data?.harga}")
                              ],
                            ),
                            const SizedBox(
                              height: kDefaultPadding / 3,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total: ${data?.kuantitas}",
                                    style: kBlackText,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
    );
  }

  Widget _buildRow(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: kBlackText,
          ),
          Text(
            val,
            style: kBlackText.copyWith(fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
