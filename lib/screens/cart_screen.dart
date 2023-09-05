import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.black), // Change color as needed
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("SHOPPING BAG"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                // Handle the onPressed event here
              },
            ),
          ],
          titleTextStyle: const TextStyle(color: Colors.black),
          backgroundColor: Colors.white),
          body: const Center(
        child: Text('This is a new screen'),
      ),
    );
  }
}
