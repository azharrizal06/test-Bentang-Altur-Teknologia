import 'dart:convert';

class Rating {
  final double rate;
  final int count;

  const Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: (json['rate'] ?? 0).toDouble(), count: json['count'] ?? 0);

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    description: json['description'] ?? '',
    category: json['category'] ?? '',
    image: json['image'] ?? '',
    rating: Rating.fromJson(json['rating'] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating.toJson(),
  };

  String toJsonString() => json.encode(toJson());
  static Product fromJsonString(String s) =>
      Product.fromJson(json.decode(s) as Map<String, dynamic>);
}
