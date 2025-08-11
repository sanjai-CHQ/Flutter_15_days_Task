import 'package:flutter/material.dart';
import '../utils/custom_routes.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  
  ProductDetailScreen({
    this.productName = 'Sample Product',
    this.productPrice = 0.0,
    this.productImage = '📦',
  });
  
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.blue[600],
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to wishlist!')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sharing ${widget.productName}...')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Center(
                child: Text(
                  widget.productImage,
                  style: TextStyle(fontSize: 120),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 8),
                  
                  // Product Price
                  Text(
                    '\$${widget.productPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.green[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Product Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a high-quality ${widget.productName} that offers excellent value for money. '
                    'Perfect for everyday use with premium materials and modern design.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Quantity Selector
                  Row(
                    children: [
                      Text(
                        'Quantity: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: quantity > 1 ? () {
                          setState(() {
                            quantity--;
                          });
                        } : null,
                        icon: Icon(Icons.remove),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
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
                  
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideFromBottomRoute(page: CartScreen()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $quantity ${widget.productName}(s) to cart!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Text('ADD TO CART'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text('BUY NOW'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[600],
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
