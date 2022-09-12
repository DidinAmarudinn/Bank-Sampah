import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/dialog_add_trash.dart';
import 'package:bank_sampah/widget/card_trash_product.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/constants.dart';
import '../../../widget/tb_button_primary_widget.dart';

class TrashCalculatorPage extends StatefulWidget {
  static const routeName = '/trash-calculator-page';
  const TrashCalculatorPage({Key? key}) : super(key: key);

  @override
  State<TrashCalculatorPage> createState() => _TrashCalculatorPageState();
}

class _TrashCalculatorPageState extends State<TrashCalculatorPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: CustomAppBar(titlePage: "Kalkulator Sampah"),
                  ),
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: kGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -40,
                    bottom: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kDarkGreen.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 12,
                                offset: const Offset(3, 3))
                          ]),
                      margin: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      width: double.infinity,
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Cari Sampah",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                itemCount: 24,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        showDialog(
                          
                          context: context,
                          builder: (BuildContext context) {
                            return const DialogAddTrash();
                          },
                        );
                      },
                      child: const CardTrashProduct());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 2,
                  vertical: kDefaultPadding / 2),
              child: TBButtonPrimaryWidget(
                buttonName: "Hitung",
                onPressed: () {
                  context.push(CheckoutScreen.routeName);
                },
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
