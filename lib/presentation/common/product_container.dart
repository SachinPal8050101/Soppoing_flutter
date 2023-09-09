import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/presentation/screens/product_detailes.dart';

class ProductContainer extends StatefulWidget {
  final ProductModel product;
  const ProductContainer({Key? key, required this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  var isItemInWishList = false;

  void addProductToWishList() {
    setState(() {
      isItemInWishList = !isItemInWishList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailes(productId: widget.product.id.toString())),
        ).then((value) => FocusScope.of(context).requestFocus(FocusNode())),
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 230, 226, 226)),
        ),
        height: deviceHeight / 2 - deviceHeight * 7 / 100,
        width: deviceWidth / 2,
        child: SingleChildScrollView(
          // Added SingleChildScrollView
          child: Column(
            children: [
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      widget.product!.banner.toString(),
                      width: deviceWidth / 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.product?.name ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ),
                            IconButton(
                              icon: isItemInWishList
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border),
                              color: Colors.black,
                              splashRadius: 1,
                              iconSize: 20,
                              onPressed: () {
                                addProductToWishList();
                                if (kDebugMode) {
                                  print('Notification button pressed');
                                }
                              },
                            ),
                          ],
                        ),
                        Text(
                          widget.product.desc.toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Row(
                          children: [
                            const Text(
                              "₹2,799",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                    widget.product.price.toString() ?? '',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold))),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(
                                        0x40FF0000), // Red color with less opacity
                                    Color(
                                        0x80FF0000), // Red color with full opacity
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 2, bottom: 2),
                              child: const Text("60% OFF!",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.red)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 2),
                                child: Text(
                                  widget.product.price.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                )),
                            const Text(
                              'with coupon',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Text(
                          'Delivery by Sep 7',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}