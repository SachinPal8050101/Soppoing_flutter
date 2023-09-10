import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/screens/cart_screen.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_state.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_cubit.dart';

class CustomeStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeStatusBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        var cartItemCount = 0;
        var wishListCount = 0;
        if (state is CustomerLoadedState) {
          cartItemCount = state.customer.customeCart?.length ?? 0;
          wishListCount = state.customer.customeWishlist?.length ?? 0;
        }
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
                        onPressed: () {
                          if (kDebugMode) {
                            print('Notification button pressed');
                          }
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.black),
                            onPressed: () {},
                          ),
                          wishListCount > 0
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
                                      wishListCount.toString(),
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
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.card_travel,
                                color: Colors.black),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()),
                              ).then((value) => FocusScope.of(context)
                                  .requestFocus(FocusNode()));
                              if (kDebugMode) {
                                print('Notification button pressed');
                              }
                            },
                          ),
                          cartItemCount > 0
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
                                      cartItemCount.toString(),
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
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(30.0), // adjust the size as needed
            child: Padding(
              padding:
                  const EdgeInsets.all(10.0), // adjust the padding as needed
              child: Container(
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10),
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
      },
    );
  }
}
