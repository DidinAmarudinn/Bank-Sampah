// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class ItemFilter extends StatelessWidget {
  final bool? isChecked;
  final String? iconName;
  final String title;
  final Color color;
  final void Function(bool? newVal) onCheck;
  const ItemFilter({
    Key? key,
    this.isChecked,
    required this.iconName,
    required this.title,
    required this.color,
    required this.onCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconName != null
            ? Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    iconName!,
                    height: 14,
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: iconName != null ? kDefaultPadding : 0,
        ),
        Expanded(
          child: Text(
            title,
            style: kBlackText.copyWith(
              fontWeight: bold,
            ),
          ),
        ),
        const SizedBox(
          width: kDefaultPadding,
        ),
        Checkbox(
            value: isChecked,
            checkColor: Colors.white,
            activeColor: kDarkGreen,
            onChanged: (val) {
              onCheck(val);
            })
      ],
    );
  }
}
