import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/utils/secure_storage.dart';
import 'package:shopping_flutter/data/models/customer_model.dart';
import 'package:shopping_flutter/data/repositories/customer_repositories.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerLoadingState()) {
    getCustomerProfile();
  }
  CustomerModal? customer;

    Future<String?> getAccessToken() async {
    String? val = await SecureStorage.getKeyByName('token');
    return val;
    }

  CustomerReposoitories customerRepo = CustomerReposoitories();

  void getCustomerProfile() async {
    var token = getAccessToken();
    try {
      CustomerModal customer = await customerRepo.getCustomerProfile(token);
      emit(CustomerLoadedState(customer));
      this.customer = customer;
    } catch (ex) {
      emit(CustomerErrorState("Can't fetch cutomer,$ex"));
    }
  }

  bool isProductInWishlist(String? productId) {
       return customer!.customeWishlist!.any((item) => item['productId'] == productId);
  }
}
