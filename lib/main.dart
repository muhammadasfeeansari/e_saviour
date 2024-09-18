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
      initialRoute: "/login",
      routes: {
        MyRoutes.HomeRoute: (context) => const HomePage(),
        MyRoutes.SignupRoute: (context) => const SigUpPage(),
        MyRoutes.LoginRoute: (context) => const LoginPage(),
      },
    );
  }
}
