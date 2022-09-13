import 'package:bank_sampah/feature/activity/ui/detail_activity_screen.dart';
import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/feature/address/ui/select_address_screen.dart';
import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/ui/home_page.dart';
import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/nasabah/ui/add_nasabah_data_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/nasabah_screen.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/ojek_screen.dart';
import 'package:bank_sampah/feature/register/provider/register_provider.dart';
import 'package:bank_sampah/feature/register/ui/register_page.dart';
import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/feature/withdraw/bank/ui/withdraw_bank_screen.dart';
import 'package:bank_sampah/feature/withdraw/ewallet/ui/withdraw_ewallet_screen.dart';
import 'package:bank_sampah/feature/withdraw/ui/withdraw_point_screen.dart';
import 'package:bank_sampah/splash_screen.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => OjekProvider())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const SplasScreen();
        },
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: RegisterPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: MainPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: HomePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: SelectAddressScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SelectAddressScreen();
        },
      ),
      GoRoute(
          path: TrashCalculatorPage.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const TrashCalculatorPage();
          }),
      GoRoute(
          path: CheckoutScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const CheckoutScreen();
          }),
      GoRoute(
          path: WithdrawPointScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const WithdrawPointScreen();
          }),
      GoRoute(
          path: WithdarwBankScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const WithdarwBankScreen();
          }),
      GoRoute(
          path: DetailActiviyScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const DetailActiviyScreen();
          }),
      GoRoute(
          path: AddDataNasabahScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const AddDataNasabahScreen();
          }),
      GoRoute(
          path: NasabahScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const NasabahScreen();
          }),
      GoRoute(
          path: AddAddressScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const AddAddressScreen();
          }),
      GoRoute(
        path: WithdrawEwalletScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          String? eWalletName = state.extra as String?;
          return WithdrawEwalletScreen(
            eWalletName: eWalletName ?? "",
          );
        },
      ),
      GoRoute(
          path: OjekScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            bool? isDaily = state.extra as bool?;
            return OjekScreen(
              isDaily: isDaily ?? false,
            );
          }),
    ],
  );
}
