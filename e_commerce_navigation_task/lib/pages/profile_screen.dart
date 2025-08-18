import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[50],
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Text('SS', style: TextStyle(fontSize: 36, color: Colors.white)),
                ),
                SizedBox(height: 16),
                Text('Sanjai', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('sanjai@gmail.com', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          
          // Profile Menu
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text('My Orders'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Orders page coming soon!')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Wishlist'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Wishlist coming soon!')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Addresses'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Addresses coming soon!')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Settings coming soon!')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
