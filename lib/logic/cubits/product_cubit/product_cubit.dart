import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/data/repositories/product_repositories.dart';
import 'package:shopping_flutter/logic/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState()) {
    fetchProducts();
  }

  ProductReposoitories postRepository = ProductReposoitories();

  void fetchProducts() async {
    try {
      List<ProductModel> products = await postRepository.fetchProducts();
      emit(ProductLoadedState(products));
    } catch (ex) {
      emit(ProductErrorState(
          "Can't fetch posts, please check your internet connection! $ex"));
    }
  }
}
