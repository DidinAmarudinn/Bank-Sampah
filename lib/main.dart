import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/provider/activity_provider.dart';
import 'package:bank_sampah/feature/activity/ui/detail_activity_screen.dart';
import 'package:bank_sampah/feature/activity/ui/detail_slider_activity_screen.dart';
import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/feature/address/ui/select_address_screen.dart';
import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/provider/main_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/feature/dashboard/ui/home_page.dart';
import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/nasabah/ui/add_nasabah_data_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/complete_profile_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/nasabah_screen.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/ojek_screen.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/change_password_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/edit_profile_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/help_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/privacy_policy_screen.dart';
import 'package:bank_sampah/feature/register/provider/register_provider.dart';
import 'package:bank_sampah/feature/register/ui/register_page.dart';
import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/provider/calculator_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/feature/withdraw/bank/ui/withdraw_bank_screen.dart';
import 'package:bank_sampah/feature/withdraw/ewallet/ui/withdraw_ewallet_screen.dart';
import 'package:bank_sampah/feature/withdraw/ui/withdraw_point_screen.dart';
import 'package:bank_sampah/splash_screen.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
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
        ChangeNotifierProvider(
            create: (_) => MainPageProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
            create: (_) => ProfileProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(create: (_) => ActivityProvider()),
        ChangeNotifierProvider(
            create: (_) => HomePageProvider(
                PreferencesHelper(
                    sharedPreference: SharedPreferences.getInstance()),
                DashboardService())),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(
            create: (_) => AddressProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(create: (_) => OjekProvider()),
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
        ChangeNotifierProvider(
          create: (_) => NasabahProvider(
            helper: PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()),
          ),
        ),
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
        path: CompleteProfileScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const CompleteProfileScreen();
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
          path: HelpScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const HelpScreen();
          }),
      GoRoute(
          path: ChangePasswordScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const ChangePasswordScreen();
          }),
      GoRoute(
          path: EditProfileScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const EditProfileScreen();
          }),
      GoRoute(
          path: PrivacyPolicyScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const PrivacyPolicyScreen();
          }),
      GoRoute(
          path: WithdarwBankScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const WithdarwBankScreen();
          }),
      GoRoute(
          path: DetailSliderActiviyScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            SliderModel? sliderModel = state.extra as SliderModel?;
            return DetailSliderActiviyScreen(
              sliderModel: sliderModel,
            );
          }),
      GoRoute(
          path: DetailActivityScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            Activty? activty = state.extra as Activty?;
            return DetailActivityScreen(
              activty: activty,
            );
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
