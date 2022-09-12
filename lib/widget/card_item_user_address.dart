import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class CardItemUserAddress extends StatelessWidget {
  final bool? isSelected;
  final String imageName;
  final bool? isHaveArrow;
  final String title;
  final VoidCallback? onTap;
  final String desc;
  const CardItemUserAddress(
      {Key? key,
      this.isSelected,
      required this.imageName,
      this.isHaveArrow,
      required this.title,
      required this.desc, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 36,
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kBlackText.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    desc,
                    style: kGreyText.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
