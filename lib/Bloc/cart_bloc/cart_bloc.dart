


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/database_helper.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final DatabaseHelper databaseHelper;

  CartBloc({required this.databaseHelper}) : super(const CartState(cartItems: [])) {
    on<LoadCart>((event, emit) async {
      final cartItems = await databaseHelper.getCartItems();
      emit(CartState(cartItems: cartItems));
    });

    on<AddToCart>((event, emit) async {
      await databaseHelper.insertCartItem({
        'productId': event.productId,
        'productName': event.productName,
        'price': event.price,
        'quantity': event.quantity,
      });
      final cartItems = await databaseHelper.getCartItems();
      emit(CartState(cartItems: cartItems));
    });

    on<RemoveFromCart>((event, emit) async {
      await databaseHelper.deleteCartItem(event.id);
      final cartItems = await databaseHelper.getCartItems();
      emit(CartState(cartItems: cartItems));
    });
  }
}