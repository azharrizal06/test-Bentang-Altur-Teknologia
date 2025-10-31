// lib/data/product_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/product_model.dart';

class ProductRepository {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchAllProducts() async {
    final res = await http.get(Uri.parse('$baseUrl/products'));
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
