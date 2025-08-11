import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'iPhone 15',
      'price': 999.99,
      'quantity': 1,
      'image': '📱',
    },
    {
      'name': 'Nike Air Max',
      'price': 129.99,
      'quantity': 2,
      'image': '👟',
    },
    {
      'name': 'Coffee Maker',
      'price': 79.99,
      'quantity': 1,
      'image': '☕',
    },
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
        backgroundColor: Colors.blue[600],
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep),
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart cleared!')),
              );
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Start Shopping'),
                  ),
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
                          leading: CircleAvatar(
                            child: Text(item['image'], style: TextStyle(fontSize: 24)),
                            backgroundColor: Colors.grey[200],
                          ),
                          title: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\$${item['price']} × ${item['quantity']}',
                          ),
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
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(top: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/checkout');
                          },
                          child: Text('PROCEED TO CHECKOUT'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
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