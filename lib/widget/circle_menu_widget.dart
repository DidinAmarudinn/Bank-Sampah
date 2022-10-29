import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class CircleMenuWidget extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;
  final String iconName;
  final String menuName;
  const CircleMenuWidget(
      {Key? key,
      required this.color,
      this.onTap,
      required this.iconName,
      required this.menuName})
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
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    iconName,
                    width: 18,
                  ),
                ),
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
