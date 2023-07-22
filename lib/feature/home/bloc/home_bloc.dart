import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloctesting/data/cart_items.dart';
import 'package:flutterbloctesting/data/grocery_data.dart';
import 'package:flutterbloctesting/data/wishlist_items.dart';
import 'package:flutterbloctesting/feature/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

      on<HomeToWishlistNavigateEvent>(homeToWishlistNavigateEvent);
      on<HomeToCartNavigateEvent>(homeToCartNavigateEvent);

      on <HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
      on <HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{

    print('HomeLoadingState');
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    print('HomeLoadedSuccessState');
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id']!,
        name: e['name']!,
        description: e['description']!,
        price: e['price']!,
        imageUrl: e['imageUrl']!))
        .toList()
    ));
  }


    // events for navigations
  FutureOr<void> homeToWishlistNavigateEvent(HomeToWishlistNavigateEvent event, Emitter<HomeState> emit) {

    print('navigated to wishlist');
      emit(HomeToWishlistNavigateActionState());
  }

  FutureOr<void> homeToCartNavigateEvent(HomeToCartNavigateEvent event, Emitter<HomeState> emit) {

    print('navigated to cart');
       emit(HomeToCartNavigateActionState());
  }


  // events for button clicked
  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {

    print('item wishlist button clicked');
    wishlistItems.add(event.currentIndividualProductClicked);
    emit(HomeProductItemWishlistedActionState());

  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {

    print('item cart button clicked');
    cartItems.add(event.currentIndividualProductClicked);
    emit(HomeProductItemCartedActionState());
  }

}
