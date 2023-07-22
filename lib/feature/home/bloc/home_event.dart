part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{

  final ProductDataModel currentIndividualProductClicked;

  HomeProductWishlistButtonClickedEvent({required this.currentIndividualProductClicked});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{

  final ProductDataModel currentIndividualProductClicked;

  HomeProductCartButtonClickedEvent({required this.currentIndividualProductClicked});

}

class HomeToWishlistNavigateEvent extends HomeEvent{}

class HomeToCartNavigateEvent extends HomeEvent{}