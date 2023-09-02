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
      home: Scaffold(
        appBar: CustomeStatusBar(),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}


class CustomeStatusBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeStatusBar({super.key});


@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
   
   return AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
             Image.network('https://www.freepnglogos.com/uploads/logo-myntra-png/myntra-black-and-white-32.png', width: 120,height: 230),
             Expanded(
              child: Container(
                height: 100,
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                     contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0), // Increase this value to increase the border radius
                  ),
                ),
              ),
              ),
             ),
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
          ],
        );
  }


}