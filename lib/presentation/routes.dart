import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/screens/product_details.dart';
import 'package:shopping_flutter/logic/cubits/single_product_cubit/single_product_cubit.dart';

class Routes {
  static Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/product_details':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SingleProductCubit(),
            child: ProductDetailes(productId: args.toString()),
          ),
        );
    }
    return null;
  }
}
