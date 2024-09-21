import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sviour_app/utils/routes.dart';

class Travel_Drawer extends StatelessWidget {
  const Travel_Drawer({super.key});
  static const Color primary = Color(0xFF326BFB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Container(
          color: primary, // Set drawer background color
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: primary, // Use primary color for header as well
                ),
                child: Text(
                  'TripBudgeter',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              // Registration ListTile
              _buildDrawerItem(
                context,
                icon: Icons.logout,
                text: 'Sign Out',
                onTap: () async {
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
        ),
      ),
    );
  }

  // Helper function to build ListTile with consistent styling
  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // Set icon color to white
      title: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16), // White text with professional font size
      ),
      hoverColor: Colors.white.withOpacity(0.2), // Light hover effect
      onTap: onTap,
    );
  }
}
