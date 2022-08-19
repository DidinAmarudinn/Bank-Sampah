import 'package:bank_sampah/themes/constants.dart';
import 'package:flutter/material.dart';

class TBTextfieldWidget extends StatelessWidget {
  final bool isPassword;
  final String iconName;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onShowPassword;
  final bool isShowPassword;
  const TBTextfieldWidget(
      {Key? key,
      this.isPassword = false,
      required this.iconName,
      required this.hintText,
      required this.controller,
      this.onShowPassword,
      this.isShowPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding:const EdgeInsets.only(left: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 27,
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              offset: const Offset(0, 0)),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Image.asset(
            iconName,
            width: 16,
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          Expanded(
            child: TextField(
              obscureText: isShowPassword,
              controller: controller,
              style: kBlackText.copyWith(fontSize: 12),
              decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: kHintText.copyWith(fontSize: 11)),
            ),
          ),
          isPassword
              ? IconButton(
                  onPressed: onShowPassword,
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    size: 16,
                    color: kGreyColor.withOpacity(0.5),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
