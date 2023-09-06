import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailes extends StatelessWidget {
  const ProductDetailes({super.key});

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
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                // Handle the onPressed event here
              },
            ),
            IconButton(
              icon: const Icon(Icons.card_travel, color: Colors.black),
              onPressed: () {
                // Handle the onPressed event here
              },
            ),
          ],
          titleTextStyle: const TextStyle(color: Colors.black),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(children: [
          productImageCarosal,
          productTitle,
          darkWhiteSpace(deviceWidth),
          buttonConatiner(deviceWidth)
        ]),
      ),
    );
  }
}

Widget productImageCarosal = CarouselSlider(
  items: [
Image.network(
    "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/1997153/2017/9/1/11504245663455-Roadster-Men-White-Printed-Round-Neck-T-shirt-4221504245663186-1.jpg",
    width: 600,
    height: 540,
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/1997153/2017/9/1/11504245663455-Roadster-Men-White-Printed-Round-Neck-T-shirt-4221504245663186-1.jpg",
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

Widget productTitle = Container(
    margin: const EdgeInsets.all(15),
    child: Column(
      children: [
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Roadster Men Black Solid Pure Cotton T-shirt",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
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
              const Text(
                "₹2,799",
                style: TextStyle(fontWeight: FontWeight.bold),
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

var buttonConatiner = (deviceWidth) => Container(
      margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
           onTap: () => {
            print("Tab on Add to wishlist")
          },
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            padding:
                const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
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
          onTap: () => {
            print("Tab on Add to bag")
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
            // margin: const EdgeInsets.only(left: 25, right: 5),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey,), color: Color.fromARGB(255, 253, 66, 66)),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Icon(Icons.card_travel, color: Colors.white,)),
                  const Text("ADD TO BAG", style: TextStyle(color: Colors.white),),
                ]),
          ),
        )
      ]),
    );
