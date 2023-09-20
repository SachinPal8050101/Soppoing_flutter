import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/data/repositories/product_repositories.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistScreenEvent, WishListScreenState> {
  ProductReposoitories postRepository = ProductReposoitories();
  CustomerProfileBloc customerBloc;

  WishlistBloc({required this.customerBloc})
      : super(WishListSceenInitialState()) {
    on<WishlistScreenFetchProductEvent>((event, emit) async {
      try {
        emit(WishListSceenLoadingState());
        List<ProductModel> products = await postRepository
            .fetchSingleProductByIds(customerBloc.customer!.customeWishlist);
        emit(WishListSceenSuccessState(products));
      } catch (ex) {
        emit(WishListSceenFailureState("Something went wrong"));
      }
    });
  }
}
