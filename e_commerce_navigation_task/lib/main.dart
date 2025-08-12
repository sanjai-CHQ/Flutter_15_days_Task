import 'package:e_commerce_navigation_task/pages/cart_screen.dart';
import 'package:e_commerce_navigation_task/pages/checkout_screen.dart';
import 'package:e_commerce_navigation_task/pages/main_navigation.dart';
import 'package:e_commerce_navigation_task/pages/product_details_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavigation(),
        '/product-detail': (context) => ProductDetailScreen(),
        '/cart': (context) => CartScreen(),
        '/checkout': (context) => CheckoutScreen(),
      },
    );
  }
}
