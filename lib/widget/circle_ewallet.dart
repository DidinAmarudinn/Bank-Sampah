import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class CircleEwallet extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconName;
  final String menuName;
  const CircleEwallet(
      {Key? key, this.onTap, required this.iconName, required this.menuName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 80,
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconName,
                width: 50,
              ),
              Text(
                "$menuName\n",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: kDarkGrayText.copyWith(fontSize: 11, fontWeight: bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
