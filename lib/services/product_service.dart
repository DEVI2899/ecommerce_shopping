import 'dart:convert';

import 'package:ecommerce_task/model/product_details.dart';
import 'package:http/http.dart' as http;

class ProductService{
  static const url = "https://fakestoreapi.com/products";

  Future<List<ProductDetails>> fetchItems() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductDetails.fromJson(item)).toList();

    } else {
      throw Exception("Failed to fetch product items");
    }
  }
}


