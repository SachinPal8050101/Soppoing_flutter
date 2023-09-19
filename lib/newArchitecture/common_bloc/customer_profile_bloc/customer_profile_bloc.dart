import 'customer_profile_event.dart';
import 'customer_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/utils/secure_storage.dart';
import 'package:shopping_flutter/newArchitecture/data/models/customer_model.dart';
import 'package:shopping_flutter/newArchitecture/data/repositories/customer_repositories.dart';


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
            emit(CustomerProfileErrorState('Sometrhing went wrong'));
          }
        }
      }
    });
  }
}