import 'customer_profile_event.dart';
import 'customer_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/utils/secure_storage.dart';
import 'package:shopping_flutter/data/models/customer_model.dart';
import 'package:shopping_flutter/data/repositories/customer_repositories.dart';

class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerModal? customer;

  CustomerProfileBloc() : super(CustomerProfileInitialState()) {
    on<CustomerProfileEvent>((event, emit) async {
      if (event is CustomerFetchProfileEvent) {
        var token = await SecureStorage.getKeyByName('token');
        if (token == null) {
          emit(CustomerProfileErrorState('Please logIn again'));
        } else {
          CustomerReposoitories customerReposoitories = CustomerReposoitories();
          try {
            CustomerModal customerProfile =
                await customerReposoitories.getCustomerProfile(token);
            customer = customerProfile;
            emit(CustomerProfileSuccessState(customerProfile));
          } catch (ex) {
            emit(CustomerProfileErrorState('Something went wrong'));
          }
        }
      } else if (event is CustomerAddToWishListEvent) {
        CustomerReposoitories customerReposoitories = CustomerReposoitories();
        try {
          await customerReposoitories.addToWishList(event.productId);
          add(CustomerFetchProfileEvent());
        } catch (ex) {
          emit(CustomerProfileErrorState('Something went wrong'));
        }
      }
    });
  }
}
