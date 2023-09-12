import 'package:flutter/material.dart';

@immutable
abstract class CustomerEvent {}

class AddToWishList extends CustomerEvent {
  final String? productId;

  AddToWishList(this.productId);
}