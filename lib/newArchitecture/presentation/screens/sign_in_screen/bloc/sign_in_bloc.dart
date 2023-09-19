import 'sign_in_event.dart';
import 'sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/utils/secure_storage.dart';
import 'package:shopping_flutter/newArchitecture/data/models/login_signup_model.dart';
import 'package:shopping_flutter/newArchitecture/data/repositories/customer_repositories.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      if (event is AppStartEvent) {
        var token = await SecureStorage.getKeyByName('token');
        if (token != null) {
          emit(SignInDone(token));
        } else {
          emit(SignInError('User not loged in'));
        }
      } else if (event is SignInButtonTab) {
        CustomerReposoitories customerReposoitories = CustomerReposoitories();
        emit(SignInLoading());
        try {
          LogInSignUpModal logInData = await customerReposoitories
              .logInCustomer(event.email, event.password);
              await SecureStorage.addNewKeyInStorage('token',logInData.token);
          emit(SignInDone(logInData.token as String));
        } catch (ex) {
          emit(SignInError('Error $ex'));
          throw 'error ';
        }
      } else if (event is SignOutEvent) {
        await SecureStorage.deleteKeyByName('token');
        emit(SignOutState());
      }
    });
  }
}
