import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/common/status_bar.dart';
import 'package:shopping_flutter/presentation/common/product_container.dart';
import 'package:shopping_flutter/logic/cubits/product_cubit/product_state.dart';
import 'package:shopping_flutter/logic/cubits/product_cubit/product_cubit.dart';

class ProductGridState extends StatefulWidget {
  final dynamic product;
  const ProductGridState({super.key, this.product});

  @override
  State<ProductGridState> createState() => _ProductGrid();
}

class _ProductGrid extends State<ProductGridState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeStatusBar(),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductLoadedState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductContainer(
                  product: product,
                );
              },
            );
          }

          return Center(
            child: Text("An error occured! ${state.error.toString()}"),
          );
        },
      ),
    );
  }
}
