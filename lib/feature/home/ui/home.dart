import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctesting/feature/cart/ui/cart.dart';
import 'package:flutterbloctesting/feature/home/bloc/home_bloc.dart';
import 'package:flutterbloctesting/feature/home/ui/product_tile_widget.dart';
import 'package:flutterbloctesting/feature/wishlist/ui/wishlist.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HomeBloc homeBloc= HomeBloc();


  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(

      bloc: homeBloc,

      listenWhen: (previous, current)=> current is HomeActionState,

      buildWhen: (previous, current) => current is !HomeActionState,


      listener: (context, state) {
          if(state is HomeToWishlistNavigateActionState){Navigator.push(context, CupertinoPageRoute(builder: (context)=> Wishlist()));}
          else if(state is HomeToCartNavigateActionState){Navigator.push(context, CupertinoPageRoute(builder: (context)=> Cart()));}
          else if(state is HomeProductItemWishlistedActionState){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('item wishlisted')));}
          else if(state is HomeProductItemCartedActionState){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('item carted')));}
      },


      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:

            return Scaffold(body: Center(child: CircularProgressIndicator(),),);

          case HomeLoadedSuccessState:
            final successState= state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery app'),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(onPressed: () {homeBloc.add(HomeToWishlistNavigateEvent());}, icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(onPressed: () {homeBloc.add(HomeToCartNavigateEvent());}, icon: Icon(Icons.shopping_basket_outlined)),
                ],
              ),

              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context,index){
                return ProductTileWidget(productDataModel: successState.products[index],homeBloc: homeBloc,);
              }),
            );

          case HomeErrorState:
            return Scaffold(body: Text('Error'),);

          default: return SizedBox();

        }
      },

    );
  }
}
