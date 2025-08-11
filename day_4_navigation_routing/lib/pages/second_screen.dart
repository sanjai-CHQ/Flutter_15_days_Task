import 'package:day_4_navigation_routing/pages/data_screen.dart';
import 'package:day_4_navigation_routing/pages/result_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataScreen(
                  title: 'Hello from Second Screen!',
                  message: 'This data was passed using constructor',
                )));
              },
              child: Text('Pass Data to Next Screen')
              ),
              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
                ),
                SizedBox(height: 15,),

                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
                    if (result != null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Received: $result')));
                    }
                  },
                  child: Text('Get Results from Next Screen'))
          ],
        ),
      ),
    );
  }
}