import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/logic/cubits/single_product_cubit/single_product_cubit.dart';
import 'package:shopping_flutter/logic/cubits/single_product_cubit/single_product_state.dart';

class ProductDetailes extends StatefulWidget {
  final String productId;
  const ProductDetailes({super.key, required this.productId});
  @override
  State<ProductDetailes> createState() => _ProductDetailesState();
}

class _ProductDetailesState extends State<ProductDetailes> {
  int cardItemsNumber = 0;
  int wishListItemNumber = 0;
  void incrementCardItemsNumber() {
    setState(() {
      cardItemsNumber++;
    });
  }

  void incrementInWishList() {
    setState(() {
      wishListItemNumber++;
    });
  }

  Widget productImageCarosal(banner) => CarouselSlider(
        items: [
          Image.network(
            banner,
            width: 600,
            height: 540,
            fit: BoxFit.cover,
          ),
          Image.network(
            banner,
            width: 600,
            height: 540,
            fit: BoxFit.cover,
          ),
        ],
        options: CarouselOptions(
          height: 500.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      );

  Widget productTitle(price, title) => Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 250,
              child: Text(
                title ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Text(
              "Explore brand",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13, color: Colors.red),
            )
          ]),
          Container(
            margin: const EdgeInsets.only(top: 7),
            child: Row(
              children: [
                const Text(
                  "MRP",
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Text(
                    "₹2,799",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Text(
                  price.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0x40FF0000), // Red color with less opacity
                        Color(0x80FF0000), // Red color with full opacity
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 2, bottom: 2),
                  child: const Text("60% OFF!",
                      style: TextStyle(fontSize: 11, color: Colors.red)),
                )
              ],
            ),
          )
        ],
      ));

  var darkWhiteSpace = (deviceWidth) => Container(
        width: deviceWidth, // Specify the width
        height: 30.0, // Specify the height
        color: Colors.grey[200], // Dark white color
      );

  var buttonConatiner = (deviceWidth, incrementCardItemsNumber,
          incrementInWishList) =>
      Container(
        margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () => {incrementInWishList()},
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              padding: const EdgeInsets.only(
                  left: 35, right: 35, bottom: 10, top: 10),
              // margin: const EdgeInsets.only(left: 25, right: 5),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                    const Text("WISHLIST"),
                  ]),
            ),
          ),
          InkWell(
            onTap: () => {incrementCardItemsNumber()},
            child: Container(
              padding: const EdgeInsets.only(
                  left: 35, right: 35, bottom: 10, top: 10),
              // margin: const EdgeInsets.only(left: 25, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  color: const Color.fromARGB(255, 253, 66, 66)),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: const Icon(
                          Icons.card_travel,
                          color: Colors.white,
                        )),
                    const Text(
                      "ADD TO BAG",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
            ),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
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
              Stack(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      // Handle the onPressed event here
                    },
                  ),
                  wishListItemNumber > 0
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
                              '$wishListItemNumber',
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
                    icon: const Icon(Icons.card_travel, color: Colors.black),
                    onPressed: () {
                      // Handle the onPressed event here
                    },
                  ),
                  cardItemsNumber > 0
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
                              '$cardItemsNumber',
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
            titleTextStyle: const TextStyle(color: Colors.black),
            backgroundColor: Colors.white),
        body: BlocConsumer<SingleProductCubit, SingleProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SingleProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SingleProductLoadedState) {
              final ProductModel product = state.product[0];
              return SingleChildScrollView(
                child: Column(children: [
                  productImageCarosal(product.banner),
                  productTitle(product.price, product.name),
                  darkWhiteSpace(deviceWidth),
                  buttonConatiner(deviceWidth, incrementCardItemsNumber,
                      incrementInWishList)
                ]),
              );
            }

            return Center(
              child: Text("An error occured! ${state.error.toString()}"),
            );
          },
        ));
  }
}
