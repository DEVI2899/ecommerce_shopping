import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<Map<String, dynamic>> cartItems;

  const CartState({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}
