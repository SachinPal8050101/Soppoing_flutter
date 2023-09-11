import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String? token;
  final String? id;

  AuthLoaded(
    this.token,
    this.id
  );
}

class AuthError extends AuthState {}