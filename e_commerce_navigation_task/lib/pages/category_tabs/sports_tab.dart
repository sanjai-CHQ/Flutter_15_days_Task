import 'package:flutter/material.dart';

class SportsTab extends StatelessWidget {
  final List<Map<String, dynamic>> sports = [
    {'name': 'Football', 'price': 29.99, 'image': '⚽'},
    {'name': 'Basketball', 'price': 34.99, 'image': '🏀'},
    {'name': 'Tennis Racket', 'price': 89.99, 'image': '🎾'},
    {'name': 'Golf Club', 'price': 199.99, 'image': '🏌️'},
    {'name': 'Yoga Mat', 'price': 24.99, 'image': '🧘'},
    {'name': 'Dumbbell Set', 'price': 149.99, 'image': '🏋️'},
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
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final product = sports[index];
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
