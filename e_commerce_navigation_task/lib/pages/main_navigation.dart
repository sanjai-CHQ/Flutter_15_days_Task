import 'package:e_commerce_navigation_task/pages/cart_screen.dart';
import 'package:e_commerce_navigation_task/pages/categories_screen.dart';
import 'package:e_commerce_navigation_task/pages/home_screen.dart';
import 'package:e_commerce_navigation_task/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;


  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: AppDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category'),

            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'),

            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'),
        ]
      ),
    );
  }
}