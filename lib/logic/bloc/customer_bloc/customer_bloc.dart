import 'customer_bloc_state.dart';
import 'customer_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/repositories/customer_repositories.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_cubit.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerCubit? customerCubit;
  CustomerBloc({CustomerCubit? custCubit})
      : customerCubit = custCubit,
        super(AddToWishListInital()) {
    on<CustomerEvent>((event, emit) async {
      if (event is AddToWishList) {
        if (event.productId!.isEmpty) {
          emit(AddToWishListError());
        } else {
          CustomerReposoitories customnerRepo = CustomerReposoitories();
          try {
            await customnerRepo.addToWishList(event.productId);
            emit(AddToWishListLoaded());
            customerCubit?.getCustomerProfile();
          } catch (ex) {
            emit(AddToWishListError());
            throw 'error ';
          }
        }
      }
    });
  }
}
