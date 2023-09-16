abstract class SignInState {}

class AppStart extends SignInState {}

class SignInLoading extends SignInState {}

class SignInInitialState extends SignInState {

}


class SignInDone extends SignInState {
  String token;
  SignInDone(this.token);
}

class SignInError extends SignInState {
  String error;
  SignInError(this.error);
}
