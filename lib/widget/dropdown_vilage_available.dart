import 'package:bank_sampah/feature/ojek/model/vilage_available_model.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownVilageAvailable extends StatelessWidget {
  final String? vilageName;
  const DropdownVilageAvailable({super.key, this.vilageName});

  @override
  Widget build(BuildContext context) {
    return Consumer<OjekProvider>(
      builder: (context, value, _) => Container(
        decoration: BoxDecoration(
            border: Border.all(color: kBorderGray, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Theme(
          data: ThemeData(
              textTheme:
                  TextTheme(subtitle1: kBlackText.copyWith(fontSize: 12))),
          child: DropdownSearch<VilageAvailableModel>(
            items: value.listVilage,
            itemAsString: (item) => item.text ?? "",
            popupProps: PopupProps.menu(
              errorBuilder: (context, searchEntry, exception) {
                return Center(child: Text(value.message));
              },
              emptyBuilder: (context, searchEntry) {
                return Center(
                  child: Text(
                    "Data tidak tersedia",
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
                    item.text ?? "",
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
                  hintText: "Pilih Kelurahan",
                  filled: true,
                  hintStyle: kLightGrayText,
                  border: InputBorder.none,
                  fillColor: Colors.transparent),
            ),
            selectedItem: value.selectedVilage,
            onChanged: (vilage) {
              value.selectVilage(vilage);
            },
          ),
        ),
      ),
    );
  }
}
