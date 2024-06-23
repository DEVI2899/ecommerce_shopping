import 'package:ecommerce_task/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/cart_bloc/cart_bloc.dart';
import '../Bloc/cart_bloc/cart_event.dart';
import '../Bloc/cart_bloc/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart List'),
        backgroundColor: AppColors.ratingColor,
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(
              child: Text('No items in cart'),
            );
          }

          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final item = state.cartItems[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(item['productName'],style: TextStyle(fontSize: width *0.05, fontWeight: FontWeight.bold,
                    color:AppColors.titleTextColor ,), ),
                  subtitle: Text('Price: \$${item['price']} \nQuantity: ${item['quantity']}',
                    style: TextStyle(fontSize: width *0.04, fontWeight: FontWeight.normal,
                    color:AppColors.titleTextColor ,),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart, color:AppColors.red ),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(RemoveFromCart(id: item['id']));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
