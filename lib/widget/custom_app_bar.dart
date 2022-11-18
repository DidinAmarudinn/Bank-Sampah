import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String titlePage;
  final bool? isHaveShadow;
  final Function? onTap;
  const CustomAppBar(
      {Key? key, required this.titlePage, this.isHaveShadow, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                } else {
                  context.pop();
                }
              },
              child: isHaveShadow != null
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 18,
                                offset: const Offset(2, 2))
                          ]),
                      child: Image.asset(kIcBack, width: 16),
                    )
                  : Image.asset(kIcBack, width: 16)),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          Text(
            titlePage,
            style: kGreenText.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
        ],
      ),
    );
  }
}
