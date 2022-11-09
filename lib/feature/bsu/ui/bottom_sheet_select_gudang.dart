import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/dropdown_gudang.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomSheetSelectGudang extends StatefulWidget {
  const BottomSheetSelectGudang({super.key});

  @override
  State<BottomSheetSelectGudang> createState() =>
      _BottomSheetSelectGudangState();
}

class _BottomSheetSelectGudangState extends State<BottomSheetSelectGudang> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<OjekProvider>(context, listen: false).getListGudang();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Gudang",
            style: kBlackText.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          const DropdownGudang(),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Consumer<OjekProvider>(
            builder: (context, provider, _) => TBButtonPrimaryWidget(
              buttonName: "Selanjutnya",
              onPressed: () {
                if (provider.selectedGudang != null) {
                  context.push(TrashCalculatorPage.routeName, extra: true);
                } else {
                  SnackbarMessage.showToast("Pilih gudang terlebih dahulu");
                }
              },
              height: 40,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
