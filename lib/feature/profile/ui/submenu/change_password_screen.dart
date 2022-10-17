import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../themes/constants.dart';
import '../../../../utils/img_constants.dart';
import '../../../../widget/tb_textfield_border.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = "/change-password-page";
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (provider.index > 0) {
                          provider.previousPage();
                        } else {
                          provider.resetIndex();
                          context.pop();
                        }
                      },
                      child: Container(
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
                      )),
                  const SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Text(
                    "Ubah Password",
                    style: kGreenText.copyWith(fontWeight: semiBold),
                  ),
                  const SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding,),
              Text(
                provider.description,
                style: kDarkGrayText.copyWith(fontWeight: semiBold),
              ),
              TBTextFieldWithBorder(controller: controller, hintText: ""),
              const Spacer(),
              TBButtonPrimaryWidget(
                  buttonName: provider.buttonName,
                  onPressed: () {
                    if (provider.index < 2) {
                      provider.nextPage();
                    }
                  },
                  height: 40,
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
