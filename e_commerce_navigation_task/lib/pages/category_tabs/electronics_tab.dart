import 'package:flutter/material.dart';

class ElectronicsTab extends StatelessWidget {
  final List<Map<String, dynamic>> electronics = [
    {'name': 'iPhone 15', 'price': 999.99, 'image': '📱'},
    {'name': 'Samsung Galaxy', 'price': 899.99, 'image': '📱'},
    {'name': 'MacBook Pro', 'price': 1999.99, 'image': '💻'},
    {'name': 'iPad Air', 'price': 599.99, 'image': '📱'},
    {'name': 'AirPods Pro', 'price': 249.99, 'image': '🎧'},
    {'name': 'Apple Watch', 'price': 399.99, 'image': '⌚'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: electronics.length,
        itemBuilder: (context, index) {
          final product = electronics[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product['image'], style: TextStyle(fontSize: 50)),
                  SizedBox(height: 8),
                  Text(
                    product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${product['price']}',
                    style: TextStyle(
                      color: Colors.green[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}