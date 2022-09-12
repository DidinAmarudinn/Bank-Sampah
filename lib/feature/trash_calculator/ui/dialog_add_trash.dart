import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

import '../../../widget/tb_button_primary_widget.dart';

class DialogAddTrash extends StatelessWidget {
  const DialogAddTrash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.all(kDefaultPadding / 4),
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
                  Expanded(
                    child: Image.asset(
                      kIcPhone,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Kertas ",
                        style: kGreenText.copyWith(fontSize: 12),
                      ),
                      Text(
                        "Rp 4000/kg",
                        style: kGreenText.copyWith(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Jumlah Sampah  ( Dalam kg )",
                hintStyle: kGreyText.copyWith(fontWeight: light, fontSize: 12)
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                   vertical: kDefaultPadding),
              child: TBButtonPrimaryWidget(
                buttonName: "Masukan",
                onPressed: () {},
                height: 40,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
