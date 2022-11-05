import 'package:bank_sampah/feature/bsu/provider/bsu_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class DetailTransactionBSUScreen extends StatefulWidget {
  final String id;
  static const routeName = "/detail-transaction-bsu-page";
  const DetailTransactionBSUScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailTransactionBSUScreen> createState() =>
      _DetailTransactionBSUScreenState();
}

class _DetailTransactionBSUScreenState
    extends State<DetailTransactionBSUScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BSUProvider>(context, listen: false)
          .getTransactionDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BSUProvider>(context);
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
                    titlePage:
                        provider.detailData?.transaksi?.jenis == "penagihan"
                            ? "Penjualan"
                            : "Penimbangan",
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
                _buildRow("Tanggal Transaksi",
                    provider.detailData?.transaksi?.tglTransaksi ?? ""),
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
                        height: 120,
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
                                  data?.jenisSampah ?? "",
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
                                    "Timbangan: ${data?.kuantitasTimbang}",
                                    style: kBlackText,
                                  ),
                                  data?.kuantitasDiterima != null
                                      ? Text(
                                          "Diterima: ${data?.kuantitasDiterima}",
                                          style: kBlackText,
                                        )
                                      : const SizedBox(),
                                  data?.kuantitasTerhitung != null
                                      ? Text(
                                          "Terhitung: Rp${data?.kuantitasTerhitung}",
                                          style: kGreenText.copyWith(
                                              fontWeight: bold),
                                        )
                                      : const SizedBox(),
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
