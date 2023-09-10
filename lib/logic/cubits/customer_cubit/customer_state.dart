import 'package:shopping_flutter/data/models/customer_model.dart';

abstract class CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CustomerLoadedState extends CustomerState {
  final CustomerModal customer;
  CustomerLoadedState(this.customer);
}

class CustomerErrorState extends CustomerState {
   final String error;
   CustomerErrorState(this.error);
}
