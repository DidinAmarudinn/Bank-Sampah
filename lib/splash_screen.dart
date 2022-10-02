import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/nasabah/service/nasabah_service.dart';
import 'package:bank_sampah/feature/nasabah/ui/complete_profile_screen.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/img_constants.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:bank_sampah/utils/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({Key? key}) : super(key: key);

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  final _prefenceHelper =
      PreferencesHelper(sharedPreference: SharedPreferences.getInstance());

  @override
  void initState() {
    super.initState();
    _checkUSerSession();
  }

  _checkUSerSession() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    int? id = await _prefenceHelper.getId();
    if (!mounted) return;
    if (id != null) {
      _checkIsUserHasCompletedProfile(id);
    } else {
      context.go(LoginPage.routeName);
    }
  }

  _checkIsUserHasCompletedProfile(int id) {
    NasabahService().getDataNsabah(id).then((value) {
      value.fold((l) {
        SnackbarMessage.showSnackbar(context, l.message);
      }, (r) {
        print(r?.email);
        if (r != null) {
          context.go(MainPage.routeName);
        } else {
          context.go(CompleteProfileScreen.routeName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Image.asset(
            kIcLogo,
            height: 70,
          ),
        ),
      ),
    );
  }
}
