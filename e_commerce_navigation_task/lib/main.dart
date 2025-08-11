import 'package:e_commerce_navigation_task/pages/main_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
      ),
//      navigatorKey: NavigationService.navigatorKey,
      initialRoute: '/',
      routes: {
        '/':(context) => MainNavigation(),
//        '/product':(context) => ProductDetailScreen(),
//        '/cart': (context) => CartScreen(),
  //      '/checkout': (context) => CheckoutScreen(),
    //    '/profile': (context) => ProfileScreen(),
      //  '/login': (context) => LoginScreen(),
      },
      /*
      onGenerateRoute: (settings) => {
        if (settings.name == '/product-detail'){
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(builder: (context) => ProductDetailScreen(
            productName: args?['name'] ?? 'Unknown Product',
            productPrice: args?['price'] ?? 0.0,
            productImage: args?['image'] ?? '📱',
          ),
          );
        }
        return null;
      },
      */
    );
  }
}