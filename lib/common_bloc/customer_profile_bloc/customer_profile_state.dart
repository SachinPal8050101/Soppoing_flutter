import 'package:shopping_flutter/data/models/customer_model.dart';

abstract class CustomerProfileState {}

class CustomerProfileInitialState extends CustomerProfileState {}

class CustomerProfileLoadingState extends CustomerProfileState {}

class CustomerProfileSuccessState extends CustomerProfileState {
  CustomerModal? customer;

  CustomerProfileSuccessState(this.customer);
}

class CustomerProfileErrorState extends CustomerProfileState {
  String error;

  CustomerProfileErrorState(this.error);
}

class CustomerWishListSuccess extends CustomerProfileState {}
