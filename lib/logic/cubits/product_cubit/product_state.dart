import 'package:shopping_flutter/data/models/product_model.dart';

abstract class ProductState {
  get error => null;
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  @override
  final String error;
  ProductErrorState(this.error);
}
