import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sviour_app/pages/Expenses.dart';
import 'package:sviour_app/pages/Home_Page.dart';
import 'package:sviour_app/pages/Insights.dart';
import 'package:sviour_app/pages/Trips.dart';
import 'package:sviour_app/pages/login_page.dart';
import 'package:sviour_app/pages/reports.dart';
import 'package:sviour_app/pages/signup.dart';
import 'package:sviour_app/pages/tripManagement.dart';
import 'package:sviour_app/utils/routes.dart';
import 'package:sviour_app/widgets/Drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBVP9vysNs3xWkxPQnUUktNidh1KVVu43g",
          appId: "1:959491819935:android:deb3034da74238ba5ed5aa",
          messagingSenderId: "959491819935",
          projectId: "travelapp-87f0e"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
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
        ), 
      ),
      initialRoute: "/signup", 
      routes: {
        // MyRoutes.AuthRoute: (context) => AuthPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.SignupRoute: (context) => const SigUpPage(),
        MyRoutes.LoginRoute: (context) => const LoginPage(),
        MyRoutes.TripLocationRoute: (context) => tripsLocationPage(),
        MyRoutes.DrawerRoute: (context) => Travel_Drawer(),
        MyRoutes.tripMnagementRoute: (context) => TripManagementPage(),
        MyRoutes.expensesRoute: (context) =>ExpensesPage (),
        MyRoutes.insightRoute: (context) => InsightsPage(),
        MyRoutes.ReportsRoute: (context) => ReportsPage(),
      },
    );
  }
}
