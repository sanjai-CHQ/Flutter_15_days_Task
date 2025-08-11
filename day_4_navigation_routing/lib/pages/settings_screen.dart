import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            subtitle: Text('Manage your account'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Acccount settings tapped')),
              );
            }
          ),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            subtitle: Text('Configure notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap:() {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Notification settings tapped')));
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy & Security'),
            subtitle: Text('Manage your privacy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Privacy settings tapped')),
              );
            },
          )
        ],
      )
    );
  }
}