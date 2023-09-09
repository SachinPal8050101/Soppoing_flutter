import 'package:shopping_flutter/data/models/product_model.dart';

abstract class SingleProductState {
  get error => null;
}

class SingleProductLoadingState extends SingleProductState {}

class SingleProductLoadedState extends SingleProductState {
  final List<ProductModel> product;
  SingleProductLoadedState(this.product);
}

class SingleProductErrorState extends SingleProductState {
  @override
  final String error;
  SingleProductErrorState(this.error);
}
