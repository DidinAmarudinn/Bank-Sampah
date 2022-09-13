import 'package:bank_sampah/feature/register/provider/register_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:bank_sampah/widget/loading_button.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/request_state_enum.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
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
                          "Daftar Nasabah",
                          style: kGreenText.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Lengkapi data dirimu dulu ya",
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
                        iconName: kIcEmail,
                        hintText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TBTextfieldWidget(
                        iconName: kIcProfileTF,
                        hintText: "Nama Lengkap",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TBTextfieldWidget(
                        iconName: kIcPhone,
                        hintText: "Nomor Telepon",
                        controller: phoneController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TBTextfieldWidget(
                        iconName: kIcProfileTF,
                        hintText: "Username",
                        controller: usernameController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Consumer<RegisterProvider>(
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
                        height: kDefaultPadding * 2,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text:
                              "Dengan mendaftar melalui aplikasi ini, berarti anda telah menyetujui ",
                          style: kGreyText.copyWith(fontSize: 11),
                          children: [
                            TextSpan(
                                text:
                                    "Syarat dan Ketentuan Bank Sampah Sorong Raya",
                                style: kGreenText.copyWith(fontSize: 11),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      Consumer<RegisterProvider>(
                        builder: (context, provider, _) => provider.state ==
                                RequestState.loading
                            ? const LoadingButton(
                                height: 40, width: double.infinity)
                            : TBButtonPrimaryWidget(
                                buttonName: "Daftar",
                                onPressed: () async {
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String noTelp = phoneController.text;
                                  String name = nameController.text;
                                  String username = usernameController.text;
                                  if (email.isNotEmpty &&
                                      noTelp.isNotEmpty &&
                                      name.isNotEmpty &&
                                      password.isNotEmpty &&
                                      username.isNotEmpty) {
                                    await provider.register(email, password,
                                        name, username, noTelp);
                                    if (!mounted) return;
                                    if (provider.state == RequestState.loaded) {
                                      context.pop();
                                      SnackbarMessage.showSnackbar(
                                          context, "Registrasi Berhasil");
                                    } else {
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
                        child: RichText(
                          text: TextSpan(
                            text: "Sudah memiliki akun? silahkan ",
                            style: kGreyText.copyWith(fontSize: 11),
                            children: [
                              TextSpan(
                                  text: "Login",
                                  style: kGreenText.copyWith(fontSize: 11),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pop();
                                    }),
                            ],
                          ),
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
          ),
        ],
      ),
    );
  }
}
