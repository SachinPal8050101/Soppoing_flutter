import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_state.dart';

class HomeStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeStatusBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Image.network(
                  'https://1000logos.net/wp-content/uploads/2022/08/Myntra-Logo.png',
                  width: 65,
                  height: 65,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: Colors.black,
                    onPressed: () {},
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
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.black),
                            onPressed: () {},
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
                            icon: const Icon(Icons.card_travel,
                                color: Colors.black),
                            onPressed: () {},
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
              )
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30.0), // adjust the size as needed
        child: Padding(
          padding: const EdgeInsets.all(10.0), // adjust the padding as needed
          child: Container(
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                hintText: 'Search',
                hintStyle: const TextStyle(fontFamily: "CustomFontFamily"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      35.0), // Increase this value to increase the border radius
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ), // replace 'sdsd' with your text
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
