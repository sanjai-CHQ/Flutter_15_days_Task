import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final List<Map<String, dynamic>> homeItems = [
    {'name': 'Coffee Maker', 'price': 79.99, 'image': '☕'},
    {'name': 'Vacuum Cleaner', 'price': 199.99, 'image': '🧹'},
    {'name': 'Microwave', 'price': 129.99, 'image': '📟'},
    {'name': 'Desk Lamp', 'price': 49.99, 'image': '💡'},
    {'name': 'Bed Sheets', 'price': 39.99, 'image': '🛏️'},
    {'name': 'Kitchen Knife', 'price': 29.99, 'image': '🔪'},
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
        itemCount: homeItems.length,
        itemBuilder: (context, index) {
          final product = homeItems[index];
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