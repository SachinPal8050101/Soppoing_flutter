import 'package:flutter/material.dart';
import 'package:shopping_flutter/common/product_container.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //change the number as per your need
        childAspectRatio: 0.6, //adjust this value according to your needs
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const ProductContainer();
      },
    );
  }
}