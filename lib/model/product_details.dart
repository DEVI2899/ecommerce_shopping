import 'dart:ui';

import 'package:ecommerce_task/model/rating.dart';

import 'category.dart';

class ProductDetails {
  final int id;
  final String title;
  final String price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  ProductDetails({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        description:json['description'],
        category: CategoryExtension.fromString(json['category']),
        image: json['image'],
        rating: Rating.fromJson(json['rating'])
    );
  }
}
