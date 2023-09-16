import 'package:flutter/material.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Put your logout function here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
