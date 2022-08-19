import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:bank_sampah/widget/tb_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        iconName: kIcEmail,
                        hintText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                       TBTextfieldWidget(
                        iconName: kIcEmail,
                        hintText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Consumer<LoginProvider>(
                        builder:(context,value, _) => TBTextfieldWidget(
                          iconName: kIcPassword,
                          hintText: "Password",
                          controller: passwordController,
                          isShowPassword: value.isObsured,
                          isPassword: true,
                          onShowPassword: (){value.showPassword();},
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
                      TBButtonPrimaryWidget(
                        buttonName: "Daftar",
                        onPressed: () {},
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
            ),
          ),
        ],
      ),
    );
  }
}
