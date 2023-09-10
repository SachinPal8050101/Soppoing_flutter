import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/data/repositories/product_repositories.dart';
import 'package:shopping_flutter/logic/cubits/single_product_cubit/single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit() : super(SingleProductLoadingState());

  ProductReposoitories postRepository = ProductReposoitories();

  void fetchSingleProduct(String productId) async {
    try {
      List<ProductModel> products =
          await postRepository.fetchSingleProductById(productId);
      emit(SingleProductLoadedState(products));
    } catch (ex) {
      emit(SingleProductErrorState(
          "Can't fetch posts, please check your internet connection! $ex"));
    }
  }
}
