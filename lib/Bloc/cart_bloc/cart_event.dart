import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final int productId;
  final String productName;
  final double price;
  final int quantity;

  const AddToCart({required this.productId, required this.productName, required this.price, required this.quantity});

  @override
  List<Object> get props => [productId, productName, price, quantity];
}

class RemoveFromCart extends CartEvent {
  final int id;

  const RemoveFromCart({required this.id});

  @override
  List<Object> get props => [id];
}
