import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final String userName;
  final String password;

  Login(this.userName, this.password);
}