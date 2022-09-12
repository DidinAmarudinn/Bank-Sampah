import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class ItemMenuProfile extends StatelessWidget {
  final IconData iconName;
  final String title;
  final VoidCallback onTap;
  const ItemMenuProfile(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kDarkGreen,
            ),
            child: Center(
              child: Icon(
                iconName,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          Expanded(
            child: Text(
              title,
              style: kDarkGrayText.copyWith(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          const Icon(
            Icons.navigate_next,
            color: kDarkGreen,
            size: 25,
          ),
        ],
      ),
    );
  }
}
