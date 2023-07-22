part of 'home_bloc.dart';
@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}




// EXTENDS HomeState

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{

  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState{}



// EXTENDS HomeActionState


        // action on individual item button clicked on products list
class ProductWishlistButtonClickedActionState extends HomeActionState{}

class ProductCartButtonClickedActionState extends HomeActionState{}

        // action on navigate
class HomeToWishlistNavigateActionState extends HomeActionState{}

class HomeToCartNavigateActionState extends HomeActionState{}


class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}

