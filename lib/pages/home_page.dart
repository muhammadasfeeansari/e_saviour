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
                barrierDismissible: false, // Prevent dismissing by tapping outside
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
            const SizedBox(height: 20),
            // Menu for different features
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true, // Important to allow GridView inside Column
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(), // Prevent internal scrolling
                children: [
                  _buildFeatureCard(
                    context,
                    'Trip\nManagement',
                    Icons.map_outlined,
                    Colors.orange,
                    () {
                      // Navigate to Trip Management Page
                      Navigator.pushNamed(context, MyRoutes.tripMnagementRoute);
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    'Expenses',
                    Icons.attach_money_outlined,
                    Colors.green,
                    () {
                      // Navigate to Expenses Page
                      Navigator.pushNamed(context, MyRoutes.expensesRoute);
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    'Insights',
                    Icons.bar_chart_outlined,
                    Colors.purple,
                    () {
                      // Navigate to Insights Page
                      Navigator.pushNamed(context, MyRoutes.insightRoute);
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    'Reports',
                    Icons.receipt_long_outlined,
                    Colors.blue,
                    () {
                      // Navigate to Reports Page
                      Navigator.pushNamed(context, MyRoutes.ReportsRoute);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Travel_Drawer(),
    );
  }

  // Feature Card Builder
  Widget _buildFeatureCard(BuildContext context, String title, IconData icon, Color color, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
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
