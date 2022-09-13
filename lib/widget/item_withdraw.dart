import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class ItemWithdraw extends StatelessWidget {
  final String imageName;
  final String itemName;
  final VoidCallback onTap;
  const ItemWithdraw(
      {Key? key,
      required this.imageName,
      required this.itemName,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: kBorderGray, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              child: Text(
                itemName,
                style: kDarkGrayText.copyWith(fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            const Icon(
              Icons.navigate_next,
              size: 40,
              color: kGreyColor,
            ),
            
          ],
        ),
      ),
    );
  }
}
