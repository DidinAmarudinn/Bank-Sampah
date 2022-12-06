import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/feature/trash_calculator/provider/calculator_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CardTrashProduct extends StatelessWidget {
  final TrashModel? trashModel;
  const CardTrashProduct({Key? key, required this.trashModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(3, 3))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          trashModel?.filegambar != null
              ? CachedNetworkImage(
                  imageUrl: trashModel?.filegambar ?? "",
                  fit: BoxFit.cover,
                  height: 60,
                  placeholder: (context, url) => const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SpinKitFadingCircle(size: 30, color: kDarkGreen),
                  ),
                  errorWidget: (context, url, error) {
                    return const SizedBox(
                      height: 60,
                    );
                  },
                )
              : const SizedBox(
                  height: 60,
                ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Column(
            children: [
              Text(
                trashModel?.jenisSampah ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: kGreenText.copyWith(fontSize: 12),
              ),
              Consumer<CalculatorProvider>(builder: (context, val, _) {
                if (val.isBsu) {
                  return Text(
                    "${FormatterExt().currencyFormatter.format(double.parse(trashModel?.hargaBeliUnit ?? "0.0"))} /Kg",
                    style: kGreenText.copyWith(fontSize: 12),
                  );
                } else {
                  return Text(
                    "${FormatterExt().currencyFormatter.format(double.parse(trashModel?.hargaBeliNasabah ?? "0.0"))} /Kg",
                    style: kGreenText.copyWith(fontSize: 12),
                  );
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
