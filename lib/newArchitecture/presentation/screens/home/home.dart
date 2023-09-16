import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_state.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/customer_sign_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: const ButtonStyle(),
                onPressed: () => {
                  showModalBottomSheets(context),
                },
                child: const Text('Sign In '),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: const ButtonStyle(),
                onPressed: () => {},
                child: const Text('Sign out '),
              )
            ],
          ),
          BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SignInDone) {
                return const Text("user is sign in");
              }
              return const Text("user is signOut");
            },
          )
        ],
      ),
    );
  }
}
