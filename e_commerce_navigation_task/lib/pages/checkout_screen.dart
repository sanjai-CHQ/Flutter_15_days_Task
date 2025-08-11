import 'package:e_commerce_navigation_task/services/navigation_services.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'Credit Card';
  String selectedAddress = 'Home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal:'),
                        Text('\$1209.97'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping:'),
                        Text('\$9.99'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax:'),
                        Text('\$84.70'),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$1304.66',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Delivery Address
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    RadioListTile<String>(
                      title: Text('Home Address'),
                      subtitle: Text('123 Main St, City, State 12345'),
                      value: 'Home',
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('Work Address'),
                      subtitle: Text('456 Business Ave, City, State 12345'),
                      value: 'Work',
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Payment Method
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    RadioListTile<String>(
                      title: Text('Credit Card'),
                      subtitle: Text('**** **** **** 1234'),
                      value: 'Credit Card',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('PayPal'),
                      subtitle: Text('user@example.com'),
                      value: 'PayPal',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('Cash on Delivery'),
                      subtitle: Text('Pay when you receive'),
                      value: 'Cash',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            _showOrderSuccessDialog();
          },
          child: Text('PLACE ORDER'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
  
  void _showOrderSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30),
            SizedBox(width: 10),
            Text('Order Placed!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your order has been successfully placed.'),
            SizedBox(height: 8),
            Text(
              'Order ID: #12345',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Expected delivery: 3-5 business days'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              NavigationService().navigateToAndClearStack('/');
            },
            child: Text('CONTINUE SHOPPING'),
          ),
        ],
      ),
    );
  }
}