import 'package:flutter/material.dart';

class FashionTab extends StatelessWidget {
  final List<Map<String, dynamic>> fashion = [
    {'name': 'Nike Air Max', 'price': 129.99, 'image': '👟'},
    {'name': 'Adidas Ultra', 'price': 149.99, 'image': '👟'},
    {'name': 'Levi\'s Jeans', 'price': 89.99, 'image': '👖'},
    {'name': 'Calvin Klein Shirt', 'price': 59.99, 'image': '👔'},
    {'name': 'Ray-Ban Glasses', 'price': 199.99, 'image': '🕶️'},
    {'name': 'Leather Jacket', 'price': 299.99, 'image': '🧥'},
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
        itemCount: fashion.length,
        itemBuilder: (context, index) {
          final product = fashion[index];
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