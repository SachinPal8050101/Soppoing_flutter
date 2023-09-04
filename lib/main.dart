import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomeStatusBar(),
        body: Center(child: Text("dd")),
      ),
    );
  }
}

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
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: Colors.black,
                    onPressed: () {
                      if (kDebugMode) {
                        print('Notification button pressed');
                      }
                    },
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
                     contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0), // Increase this value to increase the border radius
                  ),
                ),
              ),
              ),// replace 'sdsd' with your text
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}