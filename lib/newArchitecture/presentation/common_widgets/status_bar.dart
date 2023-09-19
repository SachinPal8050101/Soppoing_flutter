import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/newArchitecture/common_bloc/customer_profile_bloc/customer_profile_state.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Change color as needed
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Product"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Handle the onPressed event here
            },
          ),
          BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
            builder: (context, state) {
              var wishItem = 0;
              if (state is CustomerProfileSuccessState) {
                wishItem = state.customer!.customeWishlist!.length;
              }
              return Stack(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      // Handle the onPressed event here
                    },
                  ),
                  wishItem > 0
                      ? Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              wishItem.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            },
          ),
          BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
            builder: (context, state) {
              var cartItem = 0;
              if (state is CustomerProfileSuccessState) {
                cartItem = state.customer!.customeCart!.length;
              }
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.card_travel, color: Colors.black),
                    onPressed: () {
                      // Handle the onPressed event here
                    },
                  ),
                  cartItem > 0
                      ? Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              cartItem.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            },
          ),
        ],
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white);
  }
}
