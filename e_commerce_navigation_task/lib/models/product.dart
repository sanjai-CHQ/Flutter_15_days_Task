import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String image;
  final String? description;
  final String category; 

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.description,
    required this.category,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
    String? description,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [id, name, price, image, description, category];
}