import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TBTextFieldWithBorder extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? iconName;
  final int? maxLines;
  const TBTextFieldWithBorder(
      {Key? key, required this.controller, this.hintText, this.iconName, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding/2),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(color: kBorderGray, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          iconName != null
              ? Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding/4),
                child: Icon(
                    iconName!,
                    size: 20,
                    color: Colors.grey[400],
                  ),
              )
              : const SizedBox(),
          Expanded(
            child: TextField(
                controller: controller,
                style: kBlackText.copyWith(fontSize: 12),
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: kLightGrayText.copyWith(fontSize: 12),
                  border: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}
