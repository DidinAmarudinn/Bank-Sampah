import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

class CardTrashProduct extends StatelessWidget {
  final TrashModel? trashModel;
  const CardTrashProduct({Key? key, required this.trashModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(kDefaultPadding/2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset:const Offset(3, 3)
        )]

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kIcPhone, fit: BoxFit.cover,height: 60,),
          const SizedBox(height: kDefaultPadding/2,),
          Column(
            children: [
              Text(
                 trashModel?.jenisSampah ?? "",
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.center,
                style: kGreenText.copyWith(fontSize: 12),
              ),
              Text(
                trashModel?.hargaJual ?? "",
                style: kGreenText.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
