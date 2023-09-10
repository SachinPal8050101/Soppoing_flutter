import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/customer_model.dart';
import 'package:shopping_flutter/data/repositories/customer_repositories.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerLoadingState()) {
    getCustomerProfile();
  }

  CustomerReposoitories customerRepo = CustomerReposoitories();

  void getCustomerProfile() async {
    try {
      CustomerModal customer = await customerRepo.getCustomerProfile();
      emit(CustomerLoadedState(customer));
    } catch (ex) {
      emit(CustomerErrorState("Can't fetch cutomer,$ex"));
    }
  }
}
