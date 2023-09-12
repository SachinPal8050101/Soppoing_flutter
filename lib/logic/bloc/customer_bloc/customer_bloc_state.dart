import 'package:flutter/material.dart';

@immutable
abstract class CustomerState {}

class AddToWishListInital extends CustomerState {}

class AddToWishListLoaded extends CustomerState {

}

class AddToWishListError extends CustomerState {}