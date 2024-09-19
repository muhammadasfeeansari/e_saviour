import 'package:flutter/material.dart';
import 'package:sviour_app/pages/Dashboard.dart';
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
                icon: Icons.app_registration,
                text: 'Registration',
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.SignupRoute);
                },
              ),
              // Login ListTile
              _buildDrawerItem(
                context,
                icon: Icons.login,
                text: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.LoginRoute);
                },
              ),
              // Dashboard ListTile
              _buildDrawerItem(
                context,
                icon: Icons.dashboard_outlined,
                text: 'Dashboard',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(),
                      ));
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
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // Set icon color to white
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16), // White text with professional font size
      ),
      hoverColor: Colors.white.withOpacity(0.2), // Light hover effect
      onTap: onTap,
    );
  }
}
