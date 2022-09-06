import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String titlePage;
  const CustomAppBar({Key? key, required this.titlePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              context.pop();
            },
            child: Image.asset(kIcBack, width:16)),
          const SizedBox(width: kDefaultPadding/2,),
          Text(titlePage, style: kGreenText.copyWith(fontWeight: semiBold),)
        ],
      ),
    );
  }
}