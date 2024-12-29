import 'dart:convert';
import 'package:flutter/services.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double priceInRs;
  final String category;
  final double rate;
  int quantity;

  Product({
    required this.title,
    required this.review,
    required this.description,
    required this.image,
    required this.priceInRs,
    required this.seller,
    required this.category,
    required this.rate,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      review: json['review'],
      seller: json['seller'],
      priceInRs: json['price'].toDouble(),
      category: json['category'],
      rate: json['rate'].toDouble(),
      quantity: json['quantity'],
    );
  }
}

class ProductRepository {
  // Load products from a JSON file
  static Future<List<Product>> loadProducts(String category) async {
    try {
      // Read the JSON file as a string
      String jsonString =
          await rootBundle.loadString('assets/product_model.json');

      // Parse the string into a Map
      Map<String, dynamic> jsonData = json.decode(jsonString);

      // Extract the list of products for the specified category
      List<dynamic> productList = jsonData[category] ?? [];

      // Convert the list of JSON objects into a list of Product objects
      return productList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }
}
