import 'package:ecommerce_task/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import '../model/product_details.dart';

class ProductController extends ChangeNotifier{

  List<ProductDetails> productList = [];
  List<ProductDetails> get productData => productList;
  ProductService productService = ProductService();

  Future <void> fetchProducts()async {
    try {
      productList = await productService.fetchItems();
      notifyListeners();
    }catch(e){
      throw Exception('Failed to fetch products :$e');
    }
  }
}