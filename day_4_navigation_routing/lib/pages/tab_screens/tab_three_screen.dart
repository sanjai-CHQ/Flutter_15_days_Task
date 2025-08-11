import 'package:flutter/material.dart';

class TabThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab 3 - Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.orange),
            Text('Profile Tab', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}