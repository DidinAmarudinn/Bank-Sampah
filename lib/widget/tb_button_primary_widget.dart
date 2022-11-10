import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';

class TBButtonPrimaryWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final bool? isDisable;
  final bool? isHaveImage;
  const TBButtonPrimaryWidget(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width,
      this.isDisable,
      this.isHaveImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: isDisable ?? false ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isDisable ?? false ? kGreyDivider : kDarkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: isDisable ?? false
                    ? kGreyText.copyWith(fontSize: 12, fontWeight: semiBold)
                    : kWhiteText.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
              ),
              isHaveImage != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: Image.asset(
                        kicWa,
                        width: 20,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
