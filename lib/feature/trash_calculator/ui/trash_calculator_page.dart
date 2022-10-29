import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_bsu_model.dart';
import 'package:bank_sampah/feature/trash_calculator/provider/calculator_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/dialog_add_trash.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/widget/card_trash_product.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../themes/constants.dart';
import '../../../widget/tb_button_primary_widget.dart';

class TrashCalculatorPage extends StatefulWidget {
  static const routeName = '/trash-calculator-page';
  final NasabahBSUModel? nasabahBSUModel;
  const TrashCalculatorPage({Key? key, this.nasabahBSUModel}) : super(key: key);

  @override
  State<TrashCalculatorPage> createState() => _TrashCalculatorPageState();
}

class _TrashCalculatorPageState extends State<TrashCalculatorPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<CalculatorProvider>(context, listen: false).getTrashList();
    });
  }

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
                        onChanged: (query) {
                          context.read<CalculatorProvider>().searchTrash(query);
                        },
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
              child:
                  Consumer<CalculatorProvider>(builder: (context, provider, _) {
                if (provider.state == RequestState.loaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(
                        kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: provider.searchResult.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogAddTrash(
                                  trashModel: provider.searchResult[index],
                                );
                              },
                            );
                          },
                          child: CardTrashProduct(
                            trashModel: provider.searchResult[index],
                          ));
                    },
                  );
                } else if (provider.state == RequestState.loading) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: kDarkGreen,
                      size: 40,
                    ),
                  );
                } else if (provider.state == RequestState.error) {
                  return Center(
                    child: TBButtonPrimaryWidget(
                      buttonName: "Coba Lagi",
                      height: 40,
                      width: double.infinity,
                      onPressed: () {
                        provider.getTrashList();
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              child: TBButtonPrimaryWidget(
                buttonName: "Hitung",
                onPressed: () {
                  context.read<CheckoutProvider>().checkRole();
                  context.push(CheckoutScreen.routeName,
                      extra: widget.nasabahBSUModel);
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
