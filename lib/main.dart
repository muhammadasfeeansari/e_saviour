import 'package:flutter/material.dart';
import 'package:sviour_app/pages/Dashboard.dart';
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
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.tealAccent, // Button color
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          elevation: 4, // Shadow for depth
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ), // <--- Closing the textTheme block with a comma
      ),
      initialRoute: "/signup", // <--- Added comma here
      routes: {
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.SignupRoute: (context) => const SigUpPage(),
        MyRoutes.LoginRoute: (context) => const LoginPage(),
      },
    );
  }
}
