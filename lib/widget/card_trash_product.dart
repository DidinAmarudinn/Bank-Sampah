import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

class CardTrashProduct extends StatelessWidget {
  const CardTrashProduct({Key? key}) : super(key: key);

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
          Image.asset(kIcPhone, fit: BoxFit.cover,),
          const SizedBox(height: kDefaultPadding/2,),
          Column(
            children: [
              Text(
                "Kertas ",
                style: kGreenText,
              ),
              Text(
                "Rp 4000/kg",
                style: kGreenText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
