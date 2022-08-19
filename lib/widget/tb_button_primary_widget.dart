import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class TBButtonPrimaryWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const TBButtonPrimaryWidget(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kDarkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: kWhiteText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
