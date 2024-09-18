import 'package:flutter/material.dart';
import 'package:sviour_app/pages/home_page.dart';
import 'package:sviour_app/pages/login_page.dart';
import 'package:sviour_app/pages/signup.dart';
import 'package:sviour_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.SignupRoute,
      routes: {
        MyRoutes.HomeRoute: (context) => const HomePage(),
        MyRoutes.LoginRoute: (context) => const SignPage(),
        MyRoutes.SignupRoute: (context) => const LoginPage(),
      },
    );
  }
}
