import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/user_available_address/result_nasabah_type_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/constants.dart';

class DropdownNasabahAvailType extends StatelessWidget {
  const DropdownNasabahAvailType({super.key});

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
          child: DropdownSearch<ResultNasabahTypeModel>(
            items: value.listNasabahType,
            itemAsString: (item) => item.jenis ?? "",
            popupProps: PopupProps.menu(
              errorBuilder: (context, searchEntry, exception) {
                return Center(child: Text(value.message));
              },
              emptyBuilder: (context, searchEntry) {
                return Center(
                  child: Text(
                    "Silahkan pilih gudang dan kelurahan terlebih dahulu",
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
                    item.jenis ?? "",
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
                  hintText: "Pilih Jenis Nasabah",
                  filled: true,
                  hintStyle: kLightGrayText,
                  border: InputBorder.none,
                  fillColor: Colors.transparent),
            ),
            selectedItem: value.nasabahTypeModel,
            onChanged: (val) {
              value.selectNasabahType(val);
            },
          ),
        ),
      ),
    );
  }
}
