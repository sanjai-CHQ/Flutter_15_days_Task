import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.phone_android), text: 'Electronics'),
              Tab(icon: Icon(Icons.home), text: 'Home'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ElectronicsTab(),
            HomeTab(),
          ],
        ),
      ),
    );
  }
}

class ElectronicsTab extends StatelessWidget {
  final List<Map<String, dynamic>> electronics = [
    {'name': 'Phone', 'price': 299.99, 'image': '📱'},
    {'name': 'Laptop', 'price': 899.99, 'image': '💻'},
    {'name': 'Headphones', 'price': 99.99, 'image': '🎧'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: electronics.length,
        itemBuilder: (context, index) {
          final product = electronics[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product-detail', arguments: product);
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product['image'], style: TextStyle(fontSize: 50)),
                  SizedBox(height: 8),
                  Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$${product['price']}', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final List<Map<String, dynamic>> homeItems = [
    {'name': 'Coffee Maker', 'price': 79.99, 'image': '☕'},
    {'name': 'Lamp', 'price': 49.99, 'image': '💡'},
    {'name': 'Clock', 'price': 29.99, 'image': '🕐'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: homeItems.length,
        itemBuilder: (context, index) {
          final product = homeItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product-detail', arguments: product);
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product['image'], style: TextStyle(fontSize: 50)),
                  SizedBox(height: 8),
                  Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$${product['price']}', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
