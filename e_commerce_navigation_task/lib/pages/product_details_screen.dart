import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[200],
              child: Center(
                child: Text(product['image'], style: TextStyle(fontSize: 100)),
              ),
            ),
            
            SizedBox(height: 16),
            
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${product['price']}',
              style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This is a great ${product['name']} with excellent features.',
              style: TextStyle(fontSize: 16),
            ),
            
            SizedBox(height: 24),
            
            Row(
              children: [
                Text('Quantity: ', style: TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: quantity > 1 ? () {
                    setState(() {
                      quantity--;
                    });
                  } : null,
                  icon: Icon(Icons.remove),
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            
            Spacer(),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    child: Text('ADD TO CART'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: Text('BUY NOW'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
