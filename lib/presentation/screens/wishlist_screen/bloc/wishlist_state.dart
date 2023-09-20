part of 'wishlist_bloc.dart';

abstract class WishListScreenState {}

class WishListSceenInitialState extends WishListScreenState {}

class WishListSceenLoadingState extends WishListScreenState {}

class WishListSceenSuccessState extends WishListScreenState {
  List<ProductModel> products;
  WishListSceenSuccessState(this.products);
}

class WishListSceenFailureState extends WishListScreenState {
  String error;
  WishListSceenFailureState(this.error);
}
