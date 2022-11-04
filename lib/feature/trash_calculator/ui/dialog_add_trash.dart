import 'package:bank_sampah/feature/checkout/model/product_checkout.dart';
import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/formatter_ext.dart';
import '../../../widget/tb_button_primary_widget.dart';
import '../provider/calculator_provider.dart';

class DialogAddTrash extends StatefulWidget {
  final TrashModel trashModel;
  final bool? isPenimbangan;
  const DialogAddTrash({Key? key, required this.trashModel, this.isPenimbangan}) : super(key: key);

  @override
  State<DialogAddTrash> createState() => _DialogAddTrashState();
}

class _DialogAddTrashState extends State<DialogAddTrash> {
  TextEditingController controller = TextEditingController();
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
                        widget.trashModel.jenisSampah ?? "",
                        style: kGreenText.copyWith(fontSize: 12),
                      ),
                      Consumer<CalculatorProvider>(builder: (context, val, _) {
                        if (val.isBsu) {
                          return Text(
                            "${FormatterExt().currencyFormatter.format(double.parse(widget.trashModel.hargaBeliUnit ?? "0.0"))} /Kg",
                            style: kGreenText.copyWith(
                              fontSize: 12,
                            ),
                          );
                        } else {
                          return Text(
                            "${FormatterExt().currencyFormatter.format(double.parse(widget.trashModel.hargaBeliNasabah ?? "0.0"))} /Kg",
                            style: kGreenText.copyWith(
                              fontSize: 12,
                            ),
                          );
                        }
                      }),
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
                  hintStyle:
                      kGreyText.copyWith(fontWeight: light, fontSize: 12)),
              controller: controller,
              textAlign: TextAlign.center,
            ),
            Consumer<CheckoutProvider>(
              builder: (context, val, _) => Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: TBButtonPrimaryWidget(
                  buttonName: "Masukan",
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      var uuid = const Uuid();
                      var data = ProductCheckout(
                          uid: uuid.v4(),
                          trashModel: widget.trashModel,
                          weight: double.parse(controller.text));
                      val.addToCart(data, widget.isPenimbangan);
                      SnackbarMessage.showToast("Berhasil ditambahkan");
                      Navigator.pop(context);
                    } else {
                      SnackbarMessage.showSnackbar(
                          context, "masukan berat sampah");
                    }
                  },
                  height: 40,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
