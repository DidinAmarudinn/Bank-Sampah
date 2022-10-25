import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class TBButtonPrimaryWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final bool? isDisable;
  const TBButtonPrimaryWidget(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width,
      this.isDisable})
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
          child: Text(
            buttonName,
            style: isDisable ?? false
                ? kGreyText.copyWith(fontSize: 12, fontWeight: semiBold)
                : kWhiteText.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
          ),
        ),
      ),
    );
  }
}
