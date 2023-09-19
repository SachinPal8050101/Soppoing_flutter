abstract class SignInEvent {}

class AppStartEvent extends SignInEvent {}

class SignInButtonTab extends SignInEvent {
  String email;
  String password;

  SignInButtonTab(this.email, this.password);
}

class SignOutEvent extends SignInEvent {
  SignOutEvent();
}
