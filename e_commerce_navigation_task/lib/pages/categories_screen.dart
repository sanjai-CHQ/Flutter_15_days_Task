import 'package:flutter/material.dart';
import 'category_tabs/electronics_tab.dart';
import 'category_tabs/fashion_tab.dart';
import 'category_tabs/home_tab.dart';
import 'category_tabs/sports_tab.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          backgroundColor: Colors.blue[600],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.phone_android), text: 'Electronics'),
              Tab(icon: Icon(Icons.checkroom), text: 'Fashion'),
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.sports_soccer), text: 'Sports'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ElectronicsTab(),
            FashionTab(),
            HomeTab(),
            SportsTab(),
          ],
        ),
      ),
    );
  }
}