import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/nasabah/ui/complete_profile_screen.dart';
import 'package:bank_sampah/feature/register/ui/register_page.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_button_secondary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: kGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -40,
                    bottom: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kDarkGreen.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          kIcLogo,
                          height: 70,
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          "Jumpa Lagi",
                          style: kGreenText.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Kami sangat senang berjumpa dengan anda kembali",
                          style: kGreenText.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: const Offset(0, 5),
                  )
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: kDefaultPadding * 3,
                      ),
                      TBTextfieldWidget(
                        iconName: kIcProfileTF,
                        hintText: "Username",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, _) => TBTextfieldWidget(
                          iconName: kIcPassword,
                          hintText: "Password",
                          controller: passwordController,
                          isShowPassword: value.isObsured,
                          isPassword: true,
                          onShowPassword: () {
                            value.showPassword();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        "Lupa Password?",
                        style: kGreenText.copyWith(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, provider, _) => (provider.state ==
                                    RequestState.loading ||
                                provider.stateGetDataBSU ==
                                    RequestState.loading ||
                                provider.stateChecDataNasabah ==
                                    RequestState.loading)
                            ? const LoadingButton(
                                height: 40, width: double.infinity)
                            : TBButtonPrimaryWidget(
                                buttonName: "Masuk",
                                onPressed: () async {
                                  String username = emailController.text;
                                  String password = passwordController.text;
                                  if (username.isNotEmpty &&
                                      password.isNotEmpty) {
                                    await provider.login(username, password);
                                    if (!mounted) return;
                                    if (provider.state == RequestState.loaded) {
                                      if (provider.isBsu) {
                                        await provider.getDataBsu();
                                        if (!mounted) return;
                                        if (provider.stateGetDataBSU ==
                                            RequestState.loaded) {
                                          context.go(MainPage.routeName);
                                        } else {
                                          SnackbarMessage.showSnackbar(context,
                                              provider.messageErrorBsu);
                                        }
                                      } else {
                                        await provider.checkNasabahData();
                                        if (!mounted) return;
                                        if (provider.stateChecDataNasabah ==
                                            RequestState.loaded) {
                                          if (provider
                                              .checkIsUserHasCompletedProfile) {
                                            context.go(MainPage.routeName);
                                          } else {
                                            context.go(CompleteProfileScreen
                                                .routeName);
                                            SnackbarMessage.showSnackbar(
                                                context,
                                                "Complete Your Profile");
                                          }
                                        } else {
                                          SnackbarMessage.showSnackbar(context,
                                              provider.messageErrorNasabah);
                                        }
                                      }
                                    } else if (provider.state ==
                                        RequestState.error) {
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
                      Center(
                        child: Text(
                          "Atau",
                          style: kGreyText.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      TBButtonSecondaryWidget(
                        buttonName: "Daftar",
                        onPressed: () async {
                          context.push(RegisterPage.routeName);
                        },
                        height: 40,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
