import 'package:bank_sampah/feature/nasabah/model/vilage_model.dart';
import 'package:bank_sampah/feature/ojek/model/gudang_model.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../feature/nasabah/provider/nasabah_provider.dart';

class DropdownGudang extends StatelessWidget {
  final String? vilageName;
  const DropdownGudang({super.key, this.vilageName});

  @override
  Widget build(BuildContext context) {
    return Consumer<OjekProvider>(
      builder: (context, value, _) => Container(
        decoration: BoxDecoration(
            border: Border.all(color: kBorderGray, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Theme(
          data: ThemeData(
            textTheme: TextTheme(
              subtitle1: kBlackText.copyWith(
                fontSize: 12,
              ),
            ),
          ),
          child: DropdownSearch<GudangModel>(
            items: value.listGudang,
            itemAsString: (item) => vilageName ?? (item.namaGudang ?? ""),
            popupProps: PopupProps.menu(
              errorBuilder: (context, searchEntry, exception) {
                return Center(child: Text(value.message));
              },
              constraints: const BoxConstraints(maxHeight: 100),
              itemBuilder: ((context, item, isSelected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding / 3),
                  child: Text(
                    item.namaGudang ?? "",
                    style: kBlackText.copyWith(fontSize: 12),
                  ),
                );
              }),
              searchDelay: const Duration(milliseconds: 500),
              showSearchBox: false,
              isFilterOnline: true,
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  hintText: "Pilih Gudang",
                  filled: true,
                  hintStyle: kLightGrayText,
                  border: InputBorder.none,
                  fillColor: Colors.transparent),
            ),
            selectedItem: value.selectedGudang,
            onChanged: (gudang) {
              value.selectGudang(gudang);
            },
          ),
        ),
      ),
    );
  }
}
