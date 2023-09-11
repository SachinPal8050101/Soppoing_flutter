import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/utils/secure_storage.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc_event.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_cubit.dart';

void showModalBottomSheets(BuildContext context) {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthLoaded) {
            CustomerCubit customerCubit =
                BlocProvider.of<CustomerCubit>(context);
            customerCubit.getCustomerProfile(state.token);
            Navigator.of(context).pop();
            await SecureStorage.addNewKeyInStorage('token', state.token);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://images.indianexpress.com/2021/01/myntra.png',
                        width: 65,
                        height: 65,
                      ),
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ))
                    ],
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  if (state is AuthLoading)
                    Container(
                        margin: const EdgeInsets.all(10.0), // Set margin here
                        child: const CircularProgressIndicator())
                  else if (state is AuthError)
                    ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        BlocProvider.of<AuthBloc>(context)
                            .add(Login(email, password));
                      },
                    )
                  else
                    ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        BlocProvider.of<AuthBloc>(context)
                            .add(Login(email, password));
                      },
                    ),
                ],
              ));
        },
      );
    },
  );
}
