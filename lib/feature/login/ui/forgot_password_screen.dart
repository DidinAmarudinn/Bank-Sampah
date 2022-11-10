import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/give_rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../themes/constants.dart';
import '../../../utils/img_constants.dart';
import '../../../utils/request_state_enum.dart';
import '../../../utils/snackbar_message.dart';
import '../../../widget/loading_button.dart';
import '../../../widget/tb_button_primary_widget.dart';
import '../../../widget/tb_textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forogot-password-page';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kDefaultPadding,
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              spreadRadius: 4,
                              blurRadius: 30,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: const Icon(
                        Icons.navigate_before,
                        color: kDarkGreen,
                      )),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  "Lupa Password",
                  style:
                      kBlackText.copyWith(fontSize: 14, fontWeight: semiBold),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                TBTextfieldWidget(
                  iconName: kIcProfileTF,
                  hintText: "Masukan Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Consumer<LoginProvider>(
                  builder: (context, provider, _) => (provider.state ==
                              RequestState.loading ||
                          provider.stateGetDataBSU == RequestState.loading ||
                          provider.stateChecDataNasabah == RequestState.loading)
                      ? const LoadingButton(height: 40, width: double.infinity)
                      : TBButtonPrimaryWidget(
                          buttonName: "Kirim",
                          onPressed: () async {
                            String username = emailController.text;
                            if (username.isNotEmpty) {
                              await provider.forgotPassword(username);
                              if (!mounted) return;
                              if (provider.state == RequestState.loaded) {
                                SnackbarMessage.showSnackbar(context,
                                    "Link lupa password berhasil dikirim ke email $username");
                              }
                              if (provider.state == RequestState.error) {
                                SnackbarMessage.showSnackbar(
                                    context, provider.message);
                              }
                            } else {
                              SnackbarMessage.showSnackbar(
                                  context, provider.message);
                            }
                          },
                          height: 40,
                          width: double.infinity,
                        ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
