import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/give_rating_screen.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/formatter_ext.dart';
import '../../../utils/request_state_enum.dart';
import '../../../widget/custom_app_bar.dart';

class DetailOjekSampahScreen extends StatefulWidget {
  final String id;
  static const routeName = "/detail-ojek-sampah-page";
  const DetailOjekSampahScreen({super.key, required this.id});

  @override
  State<DetailOjekSampahScreen> createState() => _DetailOjekSampahScreenState();
}

class _DetailOjekSampahScreenState extends State<DetailOjekSampahScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<OjekProvider>(context, listen: false)
          .getTransactionDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OjekProvider>(context);
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
                const Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: CustomAppBar(
                    titlePage: "Ojek Sampah",
                    isHaveShadow: true,
                  ),
                ),
                _buildRow(
                  "Id Transaksi",
                  "#${provider.detailData?.transaksi?.idTransaksi ?? ""}",
                ),
                _buildRow(
                  "Nama Nasabah",
                  provider.detailData?.transaksi?.namaNasabah ?? "",
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
                provider.detailData?.detailPembayaran?.isEmpty ?? true
                    ? const SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding / 2),
                            child: Text(
                              "Detail Pembayaran",
                              style: kBlackText.copyWith(
                                fontWeight: semiBold,
                              ),
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
                provider.detailData?.detailTransaksi?.isEmpty ?? true
                    ? const SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding / 2),
                            child: Text(
                              "Detail Pemesanan Ojek Sampah",
                              style: kBlackText.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                                padding: const EdgeInsets.only(
                                    left: kDefaultPadding),
                                scrollDirection: Axis.horizontal,
                                itemCount: provider
                                    .detailData?.detailTransaksi?.length,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  var data = provider
                                      .detailData?.detailTransaksi?[index];
                                  return Container(
                                    padding: const EdgeInsets.all(
                                        kDefaultPadding / 2),
                                    width: 200,
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
                                        Text("Jenis Nasabah ${data?.jenis}"),
                                        Text("Harga ${data?.harga}"),
                                        Expanded(
                                            child: Text(
                                          "Detail alamat ${data?.detailAlamat}",
                                          maxLines: 2,
                                        )),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                provider.detailData?.transaksi?.status == "selesai" &&
                        provider.detailData?.penilaian == null
                    ? Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: TBButtonPrimaryWidget(
                          buttonName: "Berikan Penilaian",
                          onPressed: () {
                            context.push(GiveRatingScreen.routeName,
                                extra: widget.id);
                          },
                          height: 40,
                          width: double.infinity,
                        ),
                      )
                    : provider.detailData?.transaksi?.status == "selesai" &&
                            provider.detailData?.penilaian != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Penilaian",
                                  style: kBlackText.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                RatingBarIndicator(
                                  rating: double.parse(
                                      provider.detailData?.penilaian?.nilai ??
                                          "1"),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 50.0,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(
                                  height: kDefaultPadding / 3,
                                ),
                                Text(
                                  "Komentar: ${provider.detailData?.penilaian?.komentar}",
                                  style: kBlackText.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
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
