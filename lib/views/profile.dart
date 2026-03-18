import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:  AssetImage("assets/person.jpg"),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "john.doe@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Profile options
            _buildProfileTile(Icons.person_outline, "Edit Profile", () {
              // TODO: Navigate to edit profile
            }),
            _buildProfileTile(Icons.lock_outline, "Change Password", () {
              // TODO: Navigate to change password
            }),
            _buildProfileTile(
              Icons.notifications_outlined,
              "Notifications",
              () {
                // TODO: Navigate to notifications settings
              },
            ),
            _buildProfileTile(Icons.help_outline, "Help & Support", () {
              // TODO: Navigate to help
            }),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        color: Colors.blueGrey,
        items: const <Widget>[
          Icon(Icons.home, size: 30,),
          Icon(Icons.shopping_cart, size: 30, ),
          Icon(Icons.person_2, size: 30,  ),
          Icon(Icons.logout, size: 30,  ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/homescreen');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushNamed(context, '/');
              break;
          }
        },
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
