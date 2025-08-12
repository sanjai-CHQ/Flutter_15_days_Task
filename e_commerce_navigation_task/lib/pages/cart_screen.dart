import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Phone', 'price': 299.99, 'quantity': 1, 'image': '📱'},
    {'name': 'Headphones', 'price': 99.99, 'quantity': 2, 'image': '🎧'},
  ];
  
  double get totalAmount {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
                  Text('Your cart is empty', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Text(item['image'], style: TextStyle(fontSize: 30)),
                          title: Text(item['name']),
                          subtitle: Text('\$${item['price']} × ${item['quantity']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                    } else {
                                      cartItems.removeAt(index);
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text('${item['quantity']}'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item['quantity']++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('\$${totalAmount.toStringAsFixed(2)}', 
                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/checkout');
                          },
                          child: Text('CHECKOUT'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
