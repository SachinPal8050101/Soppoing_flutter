import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/data/models/product_model.dart';
import 'package:shopping_flutter/newArchitecture/data/repositories/product_repositories.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

    ProductReposoitories postRepository = ProductReposoitories();

  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchProductevent>((event, emit) async {
        try {
      List<ProductModel> products = await postRepository.fetchProducts();
      emit(HomeProductSuccess(products));
    } catch (ex) {
      emit(HomeProductFailure(
          "Something went wrong"));
    }
    });
  }
}
