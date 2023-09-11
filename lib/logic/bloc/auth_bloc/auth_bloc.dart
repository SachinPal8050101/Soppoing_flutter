import 'auth_bloc_event.dart';
import 'auth_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/login_signup_model.dart';
import 'package:shopping_flutter/data/repositories/customer_repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        if (event.userName.isEmpty || event.password.isEmpty) {
          emit(AuthError());
        } else {
          CustomerReposoitories customnerRepo = CustomerReposoitories();
          emit(AuthLoading());
          try {
            LogInSignUpModal logInData = await customnerRepo.logInCustomer(
                event.userName, event.password);
            emit(AuthLoaded(logInData.token, logInData.token));
          } catch (ex) {
            emit(AuthError());
            throw 'error ';
          }
        }
      }
    });
  }
}
