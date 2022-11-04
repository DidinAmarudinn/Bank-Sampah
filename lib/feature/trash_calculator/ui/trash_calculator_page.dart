import 'package:bank_sampah/feature/checkout/model/checkout_penimbangan_request.dart';
import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/provider/calculator_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/dialog_add_trash.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/card_trash_product.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../themes/constants.dart';
import '../../../utils/formatter_ext.dart';
import '../../../widget/tb_button_primary_widget.dart';

class TrashCalculatorPage extends StatefulWidget {
  static const routeName = '/trash-calculator-page';
  final bool? isPenimbangan;
  const TrashCalculatorPage({Key? key, this.isPenimbangan}) : super(key: key);

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
      if (widget.isPenimbangan != null) {
        Provider.of<CheckoutProvider>(context, listen: false).clearCart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer2<CheckoutProvider, OjekProvider>(
        builder: (context, provider, ojekProvider, _) => provider.list.isEmpty
            ? const SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: provider.state == RequestState.loading
                    ? const SpinKitFadingCircle(
                        size: 40,
                        color: kDarkGreen,
                      )
                    : InkWell(
                        onTap: () async {
                          if (widget.isPenimbangan != null) {
                            var date = DateTime.now();
                            final f = DateFormat('yyyy-MM-dd');
                            String transactionDate = f.format(date);
                            String transactionEndDate = f.format(
                                DateTime(date.year, date.month + 1, date.day));
                            String idGudang =
                                ojekProvider.selectedGudang?.id ?? "";
                            CheckoutPenimbanganRequest request =
                                CheckoutPenimbanganRequest(
                                    tglTransaksi: transactionDate,
                                    tglJatuhTempo: transactionEndDate,
                                    keterangan: "",
                                    idGudang: idGudang,
                                    totalTagihan:
                                        provider.totalPrice.toString(),
                                    idsSampah: provider.ids,
                                    kuantitasTimbang: provider.quantities,
                                    harga: provider.prices);
                            await provider.checkoutPenimbangan(request);
                            if (provider.state == RequestState.loaded) {
                              SnackbarMessage.showToast(
                                  "Data penimbangan berhasil ditambahkan");
                              provider.clearCart();
                            } else {
                              SnackbarMessage.showToast(provider.message);
                            }
                          } else {
                            context.push(CheckoutScreen.routeName);
                          }
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding / 2,
                                vertical: kDefaultPadding / 3),
                            decoration: BoxDecoration(
                                color: kDarkGreen,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: kDefaultPadding / 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${provider.list.length} Item",
                                          style: kWhiteText.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                        Text(
                                          "Harga ${FormatterExt().currencyFormatter.format(provider.totalPrice)}",
                                          style: kWhiteText.copyWith(
                                              fontWeight: light, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                widget.isPenimbangan != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding / 2),
                                        child: Text(
                                          "Jual",
                                          style: kWhiteText.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                      )
                                    : Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          size: 25,
                                          color: kDarkGreen,
                                        ),
                                      ),
                              ],
                            )),
                      ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: CustomAppBar(
                        titlePage: widget.isPenimbangan != null
                            ? "Penimbangan"
                            : "Kalkulator Sampah"),
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
                                  isPenimbangan: widget.isPenimbangan,
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
          ],
        ),
      ),
    );
  }
}
