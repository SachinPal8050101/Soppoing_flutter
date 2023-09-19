import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_event.dart';

class CustomerProfile extends StatelessWidget {
   final Function onTabTapped;
  const CustomerProfile({super.key, required this.onTabTapped });

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
              context.read<SignInBloc>().add((SignOutEvent()));
              onTabTapped(0); 
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
