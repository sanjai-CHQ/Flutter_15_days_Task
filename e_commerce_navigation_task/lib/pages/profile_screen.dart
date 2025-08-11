import 'package:flutter/material.dart';
import '../utils/custom_routes.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.blue[600],
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit profile coming soon!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              color: Colors.blue[50],
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue[600],
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            // Profile Menu
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildProfileMenuItem(
                    context,
                    Icons.shopping_bag,
                    'My Orders',
                    'View your order history',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Orders page coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.favorite,
                    'Wishlist',
                    'Your saved items',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Wishlist page coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.location_on,
                    'Addresses',
                    'Manage your addresses',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Addresses page coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.payment,
                    'Payment Methods',
                    'Manage cards and payments',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Payment methods coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.notifications,
                    'Notifications',
                    'Manage your notifications',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notification settings coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.help,
                    'Help & Support',
                    'Get help and support',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Help page coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.info,
                    'About',
                    'App information',
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('About page coming soon!')),
                      );
                    },
                  ),
                  _buildProfileMenuItem(
                    context,
                    Icons.logout,
                    'Logout',
                    'Sign out of your account',
                    () {
                      _showLogoutDialog(context);
                    },
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProfileMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Colors.red : Colors.blue[600],
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isLogout ? Colors.red : Colors.black,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
  
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.push(
                context,
                FadePageRoute(page: LoginScreen()),
              );
            },
            child: Text(
              'LOGOUT',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}