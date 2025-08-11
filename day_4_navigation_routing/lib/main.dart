import 'package:day_4_navigation_routing/pages/home_screen.dart';
import 'package:day_4_navigation_routing/pages/not_found_screen.dart';
import 'package:day_4_navigation_routing/pages/profile_screen.dart';
import 'package:day_4_navigation_routing/pages/second_screen.dart';
import 'package:day_4_navigation_routing/pages/settings_screen.dart';
import 'package:day_4_navigation_routing/pages/tabs_screen.dart';
import 'package:day_4_navigation_routing/pages/third_screen.dart';
import 'package:day_4_navigation_routing/pages/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/tabs': (context) => TabsScreen(),
      },

      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => NotFoundScreen());
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/user') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => UserScreen(
              userName: args?['name'] ?? 'unknown',
              userAge: args? ['age' ]?? 0
            ));
        }
        return null;
      },
    );
  }
}
