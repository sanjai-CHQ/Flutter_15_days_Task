import 'package:day_4_navigation_routing/pages/profile_screen.dart';
import 'package:day_4_navigation_routing/pages/second_screen.dart';
import 'package:day_4_navigation_routing/utils/custom_routes.dart';
import 'package:day_4_navigation_routing/widgets/app_drawer.dart';
import'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Navigation and Routing',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()
                ),
                );
              },
              child: Text('Go to Second Screen (Push)'),
            ),
            SizedBox(height: 15,),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              } , 
              child: Text('Go to Third Screen (Named Route)'),
              ),
              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, SlidePageRoute(page: ProfileScreen()),
                  );
                },
                child: Text('Profile (Custom Animation)'),
                ),
                SizedBox(height: 15,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user',
                    arguments: {'name': 'John Doe', 'age': 25},
                    );
                  }, child: Text('User Profile (With Args)'),
                  ),
                  SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tabs');
                    },
                    child: Text('Go to Tabs Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Navigator.pushNamed(context, '/settings');
        },
        child: Icon(Icons.settings),
        tooltip: 'Settings',
      ),
    );
  }
}