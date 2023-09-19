part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeProductLoading extends HomeState {}

class HomeProductSuccess extends HomeState {
   List<ProductModel> products;
  HomeProductSuccess(this.products);
}

class HomeProductFailure extends HomeState {
  String error;
  HomeProductFailure(this.error);
}


