import 'package:bank_sampah/feature/withdraw/pdam/model/pasca.dart';
import 'package:bank_sampah/feature/withdraw/pdam/provider/pdam_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownWilayahPDAM extends StatelessWidget {
  const DropdownWilayahPDAM({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PDAMProvider>(
      builder: (context, value, _) => Container(
        decoration: BoxDecoration(
            border: Border.all(color: kBorderGray, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Theme(
          data: ThemeData(
              textTheme:
                  TextTheme(subtitle1: kBlackText.copyWith(fontSize: 12))),
          child: DropdownSearch<Pasca>(
            items: value.wilayahModel?.pasca ?? [],
            itemAsString: (item) => item.name ?? "",
            popupProps: PopupProps.menu(
              errorBuilder: (context, searchEntry, exception) {
                return Center(child: Text(value.message));
              },
              emptyBuilder: (context, searchEntry) {
                return Center(
                  child: Text(
                    "",
                    style: kGreyText.copyWith(fontSize: 12),
                  ),
                );
              },
              constraints: const BoxConstraints(maxHeight: 200),
              itemBuilder: ((context, item, isSelected) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2,
                      vertical: kDefaultPadding / 3),
                  child: Text(
                    item.name ?? "",
                    style: kBlackText.copyWith(fontSize: 12),
                  ),
                );
              }),
              searchDelay: const Duration(milliseconds: 500),
              searchFieldProps: TextFieldProps(
                  style: kBlackText.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                      hintText: "Wilayah",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: kDarkGreen), //<-- SEE HERE
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: kDarkGreen), //<-- SEE HERE
                      ),
                      hintStyle: kLightGrayText)),
              showSearchBox: true,
              isFilterOnline: true,
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  hintText: "Pilih Wilayah",
                  filled: true,
                  hintStyle: kLightGrayText,
                  border: InputBorder.none,
                  fillColor: Colors.transparent),
            ),
            selectedItem: value.selectedPasca,
            onChanged: (pasca) {
              value.selectPasca(pasca);
            },
          ),
        ),
      ),
    );
  }
}
