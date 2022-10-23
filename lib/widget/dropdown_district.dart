import 'package:bank_sampah/themes/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/nasabah/model/district_model.dart';
import '../feature/nasabah/provider/nasabah_provider.dart';

class DropdownDistrict extends StatelessWidget {
  final String? disctrictName;
  const DropdownDistrict({super.key, this.disctrictName});

  @override
  Widget build(BuildContext context) {
    return Consumer<NasabahProvider>(
        builder: (context, value, _) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBorderGray, width: 1),
                 borderRadius: BorderRadius.circular(10)
              ),
              child: Theme(
                data: ThemeData(textTheme: TextTheme(subtitle1: kBlackText.copyWith(fontSize: 12))),
                child: DropdownSearch<DistrictModel>(
                  asyncItems: (text) async {
                    return await value.updateListDistricts(text);
                  },
                  itemAsString: (item) => disctrictName ?? (item.districtName ?? ""),
                  popupProps: PopupProps.menu(
                    errorBuilder: (context, searchEntry, exception) {
                      return Center(child: Text(value.message));
                    },
                    constraints: const BoxConstraints(maxHeight: 200),
                    itemBuilder: ((context, item, isSelected) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2,
                            vertical: kDefaultPadding / 3),
                        child: Text(item.districtName ?? "",style: kBlackText.copyWith(fontSize: 12),),
                      );
                    }),
                    searchDelay: const Duration(milliseconds: 500),
                    searchFieldProps: TextFieldProps(
                        style: kBlackText.copyWith(fontSize: 12),
                        decoration: InputDecoration(
                            hintText: "Kecamatan",
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
                        hintText: "Pilih Kecamatan",
                        filled: true,
                        hintStyle: kLightGrayText,
                        border: InputBorder.none,
                        fillColor: Colors.transparent),
                  ),
                  selectedItem: value.selectedDistrict,
                  onChanged: (district) {
                    value.selectDistrict(district);
                   
                    value.getVilagesData();
                  },
                ),
              ),
            ));
  }
}
