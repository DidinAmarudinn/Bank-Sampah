import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/custom_app_bar.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../themes/constants.dart';
import '../../../../utils/request_state_enum.dart';
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
              const SizedBox(
                height: kDefaultPadding,
              ),
              const CustomAppBar(
                titlePage: "Ganti Password",
                isHaveShadow: true,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "Password Baru",
                style: kGreenText.copyWith(fontWeight: semiBold),
              ),
              const SizedBox(
                width: kDefaultPadding / 2,
              ),
              TBTextFieldWithBorder(
                  controller: controller, hintText: "Masukan password baru"),
              const Spacer(),
              provider.state == RequestState.loading
                  ? const LoadingButton(height: 40, width: double.infinity)
                  : TBButtonPrimaryWidget(
                      buttonName: "Ganti",
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          await provider.changePassword(controller.text);
                          if (!mounted) return;
                          if (provider.state == RequestState.loaded) {
                            SnackbarMessage.showToast(
                                "Password Berhasil dirubah");
                            context.pop();
                          } else {
                            SnackbarMessage.showToast(provider.message);
                          }
                        } else {
                          SnackbarMessage.showSnackbar(context,
                              "Silahkan masukan password baru terlebih dahulu");
                        }
                      },
                      height: 40,
                      width: double.infinity,
                    ),
              const SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
