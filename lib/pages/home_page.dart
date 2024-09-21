import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sviour_app/utils/routes.dart';
import 'package:sviour_app/widgets/Drawer.dart';

class HomePage extends StatelessWidget {
  static const Color primary = Color(0xFF326BFB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primary,
        title: const Text(
          'Trips',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              // Navigate to profile or settings
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () async {
              // Show the loading indicator
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevent dismissing by tapping outside
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );

              // Sign out the user
              await FirebaseAuth.instance.signOut();

              // Close the loading indicator dialog after a slight delay
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.pop(context); // Remove the dialog
                Navigator.pushReplacementNamed(
                    context, MyRoutes.LoginRoute); // Navigate to login
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            CustomHeader(),
            // Use VacationScreen without Scaffold
            VacationScreen(),
          ],
        ),
      ),
      drawer: Travel_Drawer(),
    );
  }
}

// Custom header
class CustomHeader extends StatelessWidget {
  static const Color primary = Color(0xFF326BFB);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile picture and welcome text
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Junaid Khan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardVacation extends StatelessWidget {
  final String title;
  final String destination;
  final String budget;
  final DateTime startDate;
  final DateTime endDate;

  const CardVacation({
    Key? key,
    required this.title,
    required this.destination,
    required this.budget,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color(0xFF326BFB),
      child: Container(
        padding: EdgeInsets.all(13.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    destination,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Budget: $budget",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start trip: ${_formatDate(startDate)}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "End trip: ${_formatDate(endDate)}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}

class VacationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardVacation(
          title: "Summer Vacation",
          destination: "Maldives",
          budget: "\$2000",
          startDate: DateTime(2024, 6, 15),
          endDate: DateTime(2024, 6, 22),
        ),
        CardVacation(
          title: "Winter Vacation",
          destination: "Switzerland",
          budget: "\$3000",
          startDate: DateTime(2024, 12, 10),
          endDate: DateTime(2024, 12, 20),
        ),
      ],
    );
  }
}
