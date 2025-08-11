import 'package:day_4_navigation_routing/pages/tab_screens/tab_one_screen.dart';
import 'package:day_4_navigation_routing/pages/tab_screens/tab_three_screen.dart';
import 'package:day_4_navigation_routing/pages/tab_screens/tab_two_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens =[
    TabOneScreen(),
    TabTwoScreen(),
    TabThreeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
            ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'),
        ],
      ),
    );
  }
}