import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_state.dart';

class WishListProductContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String productId;
  final Function onCloseTabFun;
  const WishListProductContainer(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.productId,
      required this.onCloseTabFun});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: deviceWidth / 2 - 10,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                ),
                Positioned(
                    right: 2,
                    top: 2,
                    child: IconButton(
                      onPressed: () => {onCloseTabFun(productId, context)},
                      icon: const Icon(
                        Icons.cancel,
                      ),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 8),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text('₹$price',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const Text(
                        "₹2,799",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => {
                print("move to cart"),
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 1, color: Colors.grey))),
                      height: 40,
                      child: const Center(
                          child: Text(
                        "MOVE TO BAG",
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 95, 93),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
