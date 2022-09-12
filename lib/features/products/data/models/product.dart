import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name, price, description, image, category;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory Product.initial() => const Product(
        id: 0,
        name: '',
        price: '',
        description: '',
        image: '',
        category: '',
      );

  @override
  List<Object> get props => [id, name, price, description, image, category];

  @override
  bool get stringify => true;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}
