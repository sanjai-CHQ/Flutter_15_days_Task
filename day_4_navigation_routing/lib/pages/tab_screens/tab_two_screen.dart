import 'package:flutter/material.dart';

class TabTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab 2 - Search')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 100, color: Colors.green),
            Text('Search Tab', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}