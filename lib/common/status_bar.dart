import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_flutter/screens/cart_screen.dart';

class CustomeStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeStatusBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

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
                  'https://static-00.iconduck.com/assets.00/myntra-icon-2048x1386-nda4rc65.png',
                  width: 35,
                  height: 35,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(3000.0),
                    splashColor: Colors.black.withOpacity(0.3),
                    onTap: () {
                      // Handle your onTap here.
                      if (kDebugMode) {
                        print('Image tapped!');
                      }
                    },
                    child: Image.asset(
                      'assets/icons/notification_icon.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.black,
                    onPressed: () {
                      if (kDebugMode) {
                        print('Notification button pressed');
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.card_travel),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                      if (kDebugMode) {
                        print('Notification button pressed');
                      }
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
