import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatelessWidget {
  final double height;
  final double width;
  final bool? isSecondary;
  const LoadingButton(
      {Key? key, required this.height, required this.width, this.isSecondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: isSecondary ?? false ? Colors.white : kDarkGreen,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kDarkGreen)),
      child: const Center(
        child: SpinKitFadingCircle(
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
