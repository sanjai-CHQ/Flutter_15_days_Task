import 'package:flutter/material.dart';

class TabOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab 1 - Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 100, color: Colors.blue),
            Text('Home Tab', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}