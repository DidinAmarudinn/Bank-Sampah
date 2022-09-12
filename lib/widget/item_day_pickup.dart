import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class ItemDayPickup extends StatelessWidget {
  final String titile;
  final bool isChecked;
  final void Function(bool? newVal) onCheck;
  const ItemDayPickup(
      {Key? key,
      required this.titile,
      required this.isChecked,
      required this.onCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2,
            vertical: kDefaultPadding / 3,
          ),
          child: Row(
            children: [
              Expanded(child: Text(titile)),
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                    value: isChecked,
                    checkColor: Colors.white,
                    activeColor: kDarkGreen,
                    onChanged: (val) {
                      onCheck(val);
                    }),
              )
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: kGreyDivider,
          thickness: 2.5,
        )
      ],
    );
  }
}
