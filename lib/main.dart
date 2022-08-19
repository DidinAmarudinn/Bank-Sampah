import 'package:bank_sampah/feature/login/provider/login_provider.dart';
import 'package:bank_sampah/feature/login/ui/login_page.dart';
import 'package:bank_sampah/feature/register/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
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
          return const LoginPage();
        },
      ),
      GoRoute(
        path: RegisterPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
    ],
  );
}
