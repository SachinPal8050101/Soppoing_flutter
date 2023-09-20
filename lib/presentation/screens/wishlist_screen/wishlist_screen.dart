import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/presentation/common_widgets/status_bar.dart';
import 'package:shopping_flutter/presentation/common_widgets/wishlist_product_container.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/presentation/screens/wishlist_screen/bloc/wishlist_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_state.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_event.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late StreamSubscription _subscription;

  @override
  void initState() {
    context.read<WishlistBloc>().add(WishlistScreenFetchProductEvent());
    super.initState();
  }

  void onTapCloseWishList(String productId, BuildContext context) {
    final customerProfileBloc = context.read<CustomerProfileBloc>();
    context
        .read<CustomerProfileBloc>()
        .add(CustomerAddToWishListEvent(productId));
    _subscription = customerProfileBloc.stream.listen((state) {
      if (state is CustomerProfileSuccessState) {
        context.read<WishlistBloc>().add(WishlistScreenFetchProductEvent());
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel(); // Cancel the subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: BlocConsumer<WishlistBloc, WishListScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WishListSceenSuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                ProductModel product = state.products[index];
                return WishListProductContainer(
                    imageUrl: product.banner.toString(),
                    title: product.name.toString(),
                    price: product.price.toString(),
                    productId: product.id.toString(),
                    onCloseTabFun: onTapCloseWishList);
              },
            );
          } else if (state is WishListSceenLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishListSceenFailureState) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return const Center(child: Text("Something went wrong =>"));
          }
        },
      ),
    );
  }
}
