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
      required this.desc,
      this.onTap})
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
          color: isSelected ?? false ? kBYoungBlue : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ?? false ? kBorderBlue : Colors.transparent),
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
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      imageName,
                      width: 36,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: isSelected ?? false
                        ? const Icon(
                            Icons.location_on,
                            color: kBlueColor,
                            size: 15,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
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
