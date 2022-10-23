import 'package:bank_sampah/feature/nasabah/model/vilage_model.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../feature/nasabah/provider/nasabah_provider.dart';

class DropdownVilage extends StatelessWidget {
  final String? vilageName;
  const DropdownVilage({super.key, this.vilageName});

  @override
  Widget build(BuildContext context) {
    return Consumer<NasabahProvider>(
        builder: (context, value, _) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBorderGray, width: 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Theme(
                data: ThemeData(
                    textTheme: TextTheme(
                        subtitle1: kBlackText.copyWith(fontSize: 12))),
                child: DropdownSearch<VilageModel>(
                  items: value.vilages,
                  
                  itemAsString: (item) => vilageName ??  (item.vilageName  ?? ""),
                  popupProps: PopupProps.menu(
                    errorBuilder: (context, searchEntry, exception) {
                      return Center(child: Text(value.message));
                    },
                    emptyBuilder: (context, searchEntry) {
                      return Center(child: Text("Silahkan pilih kecamatan terlebih dahulu", style: kGreyText.copyWith(fontSize: 12),),);
                    },
                    constraints: const BoxConstraints(maxHeight: 200),
                    
                    itemBuilder: ((context, item, isSelected) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2,
                            vertical: kDefaultPadding / 3),
                        child: Text(
                          item.vilageName ?? "",
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
            ));
  }
}
