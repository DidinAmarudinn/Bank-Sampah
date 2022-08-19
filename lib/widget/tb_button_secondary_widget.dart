import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class TBButtonSecondaryWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const TBButtonSecondaryWidget(
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
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: kDarkGreen,
            width: 1,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: kGreenText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
