import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctesting/feature/cart/bloc/cart_bloc.dart';
import 'package:flutterbloctesting/feature/cart/ui/cart_tile_widget.dart';

import '../../home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  final CartBloc cartBloc = CartBloc();


  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {
      },
      listenWhen: (previous,current)=> current is CartActionState,
      buildWhen: (previous,current)=> current is !CartActionState,
      builder: (context, state) {
         switch (state.runtimeType){
          case CartSuccessState:
            final successState= state as CartSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery app'),
                backgroundColor: Colors.teal,
                actions: [
                //  IconButton(onPressed: () {homeBloc.add(HomeToWishlistNavigateEvent());}, icon: Icon(Icons.favorite_border_outlined)),
                //  IconButton(onPressed: () {homeBloc.add(HomeToCartNavigateEvent());}, icon: Icon(Icons.shopping_basket_outlined)),
                ],
              ),

              body: ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context,index){
                    return CartProductTileWidget(productDataModel: successState.cartItems[index], cartBloc: cartBloc,);
                  }),
            );;

           default :
             return SizedBox();
        };
      },
    );
  }
}

/***
 * Scaffold(
    appBar: AppBar(
    title: Text('Cart'),
    backgroundColor: Colors.teal,
    ),
    body: ,
    )
 */
