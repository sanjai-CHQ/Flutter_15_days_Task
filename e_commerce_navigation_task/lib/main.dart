import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_navigation.dart';
import 'pages/product_details_screen.dart';
import 'pages/cart_screen.dart';
import 'pages/checkout_screen.dart';
import 'pages/admin_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: ECommerceApp(),
    ),
  );
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavigation(),
        '/product-detail': (context) => ProductDetailScreen(),
        '/cart': (context) => CartScreen(),
        '/checkout': (context) => CheckoutScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}
