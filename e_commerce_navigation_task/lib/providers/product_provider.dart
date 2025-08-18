import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super(_initialProducts);

  static const List<Product> _initialProducts = [
    Product(
      id: '1',
      name: 'Phone',
      price: 299.99,
      image: '📱',
      description: 'Latest smartphone with amazing features.',
      category: 'Electronics',
    ),
    Product(
      id: '2',
      name: 'Laptop',
      price: 899.99,
      image: '💻',
      description: 'High-performance laptop for work.',
      category: 'Electronics',
    ),
    Product(
      id: '3',
      name: 'Headphones',
      price: 99.99,
      image: '🎧',
      description: 'Premium noise-canceling headphones.',
      category: 'Electronics',
    ),
    Product(
      id: '4',
      name: 'Watch',
      price: 199.99,
      image: '⌚',
      description: 'Smart watch with health tracking.',
      category: 'Electronics',
    ),
    Product(
      id: '5',
      name: 'Coffee Maker',
      price: 79.99,
      image: '☕',
      description: 'Perfect coffee maker.',
      category: 'Home',
    ),
    Product(
      id: '6',
      name: 'Lamp',
      price: 49.99,
      image: '💡',
      description: 'Modern desk lamp.',
      category: 'Home',
    ),
    Product(
      id: '7',
      name: 'Clock',
      price: 29.99,
      image: '🕐',
      description: 'Elegant wall clock.',
      category: 'Home',
    ),
  ];

  void addProduct(Product product) {
    state = [...state, product];
  }

  //List<Product> getProductsByCategory(String category) {
    //return state.where((product) => product.category == category).toList();
  //}
}

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});
