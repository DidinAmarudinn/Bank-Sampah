import 'dart:io';

import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/feature/activity/provider/activity_provider.dart';
import 'package:bank_sampah/feature/activity/ui/detail_activity_screen.dart';
import 'package:bank_sampah/feature/activity/ui/detail_slider_activity_screen.dart';
import 'package:bank_sampah/feature/address/provider/address_provider.dart';
import 'package:bank_sampah/feature/address/ui/add_address_screen.dart';
import 'package:bank_sampah/feature/address/ui/select_address_screen.dart';
import 'package:bank_sampah/feature/bsu/provider/bsu_provider.dart';
import 'package:bank_sampah/feature/bsu/ui/bsu_screen.dart';
import 'package:bank_sampah/feature/bsu/ui/detail_transaction_bsu_screen.dart';
import 'package:bank_sampah/feature/checkout/provider/checkout_provider.dart';
import 'package:bank_sampah/feature/checkout/ui/checkout_screen.dart';
import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/provider/home_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/provider/main_page_provider.dart';
import 'package:bank_sampah/feature/dashboard/service/dashboard_service.dart';
import 'package:bank_sampah/feature/dashboard/ui/home_page.dart';
import 'package:bank_sampah/feature/dashboard/ui/main_page.dart';
import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/login/ui/forgot_password_screen.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_bsu_model.dart';
import 'package:bank_sampah/feature/nasabah/provider/nasabah_provider.dart';
import 'package:bank_sampah/feature/nasabah/ui/add_nasabah_data_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/complete_profile_screen.dart';
import 'package:bank_sampah/feature/nasabah/ui/nasabah_screen.dart';
import 'package:bank_sampah/feature/ojek/model/order_ojek_request.dart';
import 'package:bank_sampah/feature/ojek/provider/ojek_provider.dart';
import 'package:bank_sampah/feature/ojek/ui/detail_ojek_sampah_screen.dart';
import 'package:bank_sampah/feature/ojek/ui/give_rating_screen.dart';
import 'package:bank_sampah/feature/ojek/ui/ojek_screen.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/change_password_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/detail_profile_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/edit_profile_bsu_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/edit_profile_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/help_screen.dart';
import 'package:bank_sampah/feature/profile/ui/submenu/privacy_policy_screen.dart';
import 'package:bank_sampah/feature/register/provider/register_provider.dart';
import 'package:bank_sampah/feature/register/ui/register_page.dart';
import 'package:bank_sampah/feature/register/ui/tnc_screen.dart';
import 'package:bank_sampah/feature/transaction/provider/transaction_provider.dart';
import 'package:bank_sampah/feature/transaction/ui/detail_transaction_pembelian_nasabah.dart';
import 'package:bank_sampah/feature/trash_calculator/provider/calculator_provider.dart';
import 'package:bank_sampah/feature/trash_calculator/ui/trash_calculator_page.dart';
import 'package:bank_sampah/feature/withdraw/bank/ui/withdraw_bank_screen.dart';
import 'package:bank_sampah/feature/withdraw/ewallet/ui/withdraw_ewallet_screen.dart';
import 'package:bank_sampah/feature/withdraw/listrik/provider/listrik_provider.dart';
import 'package:bank_sampah/feature/withdraw/listrik/ui/checkout_listrik_screen.dart';
import 'package:bank_sampah/feature/withdraw/listrik/ui/listrik_pasca_screen.dart';
import 'package:bank_sampah/feature/withdraw/listrik/ui/listrik_screen.dart';
import 'package:bank_sampah/feature/withdraw/paket_data/provider/paket_data_provider.dart';
import 'package:bank_sampah/feature/withdraw/paket_data/ui/paket_data_screen.dart';
import 'package:bank_sampah/feature/withdraw/pdam/ui/pdam_screen.dart';
import 'package:bank_sampah/feature/withdraw/pdam/provider/pdam_provider.dart';
import 'package:bank_sampah/feature/withdraw/provider/ppob_provider.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/provider/pulsa_provider.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/payment_method_screen.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/pulsa_screen.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/ui/success_page.dart';
import 'package:bank_sampah/feature/withdraw/ui/withdraw_point_screen.dart';
import 'package:bank_sampah/splash_screen.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      Phoenix(
        child: MyApp(),
      ),
    ),
  );
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
            create: (_) => PulsaProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
            create: (_) => PaketDataProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
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
        ChangeNotifierProvider(
            create: (_) => TransactionProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
            create: (_) => AddressProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
            create: (_) => OjekProvider(PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
          create: (_) => BSUProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PDAMProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckoutProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ListrikProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CalculatorProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PPOBProvider(
            PreferencesHelper(
              sharedPreference: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => NasabahProvider(
            helper: PreferencesHelper(
                sharedPreference: SharedPreferences.getInstance()),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Bank Sampah',
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.light(primary: kDarkGreen),
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
        path: ForgotPasswordScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: BSUScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const BSUScreen();
        },
      ),
      GoRoute(
        path: DetailTransactionBSUScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          String? id = state.extra as String?;
          return DetailTransactionBSUScreen(
            id: id ?? "0",
          );
        },
      ),
      GoRoute(
        path: DetailTransactionPembelianNasabahScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          String? id = state.extra as String?;
          return DetailTransactionPembelianNasabahScreen(
            id: id ?? "0",
          );
        },
      ),
      GoRoute(
        path: CheckoutListrikScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const CheckoutListrikScreen();
        },
      ),
      GoRoute(
        path: PDAMScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const PDAMScreen();
        },
      ),
      GoRoute(
        path: ListrikPascaScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ListrikPascaScreen();
        },
      ),
      GoRoute(
        path: GiveRatingScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          String? id = state.extra as String?;
          return GiveRatingScreen(id: id ?? "0");
        },
      ),
      GoRoute(
        path: DetailOjekSampahScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          String? id = state.extra as String?;
          return DetailOjekSampahScreen(id: id ?? "0");
        },
      ),
      GoRoute(
        path: DetailProfileScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const DetailProfileScreen();
        },
      ),
      GoRoute(
        path: SuccessPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SuccessPage();
        },
      ),
      GoRoute(
        path: PaymentMethodPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentMethodPage();
        },
      ),
      GoRoute(
        path: TNCScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const TNCScreen();
        },
      ),
      GoRoute(
        path: ListrikScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ListrikScreen();
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
          final OrderOjekRequest? ojekRequest =
              state.extra as OrderOjekRequest?;
          return SelectAddressScreen(orderOjekRequest: ojekRequest);
        },
      ),
      GoRoute(
          path: TrashCalculatorPage.routeName,
          builder: (BuildContext context, GoRouterState state) {
            bool? data = state.extra as bool?;
            return TrashCalculatorPage(
              isPenimbangan: data,
            );
          }),
      GoRoute(
          path: CheckoutScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            NasabahBSUModel? data = state.extra as NasabahBSUModel?;
            return CheckoutScreen(
              nasabahBSUModel: data,
            );
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
          path: PulsaScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const PulsaScreen();
          }),
      GoRoute(
          path: PaketDataScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const PaketDataScreen();
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
          path: EditProfileBSUScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const EditProfileBSUScreen();
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
