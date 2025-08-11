import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a result to return:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Success Result!');
              },
              child: Text('Return Success'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Error Result!');
              },
              child: Text('Return Error'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Return Nothing'),
            ),
          ],
        ),
      ),
    );
  }
}