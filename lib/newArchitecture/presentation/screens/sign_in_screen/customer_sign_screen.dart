import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_event.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_state.dart';
import 'package:shopping_flutter/newArchitecture/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/newArchitecture/common_bloc/customer_profile_bloc/customer_profile_event.dart';

void showModalBottomSheets(BuildContext context) {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<SignInBloc>(context),
          child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.of(_).viewInsets.bottom),
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
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (__, state) {
                      if (state is SignInDone) {
                        Navigator.pop(__);
                         context
                              .read<CustomerProfileBloc>()
                              .add(CustomerFetchProfileEvent());
                      }
                    },
                    builder: (__, state) {
                      if (state is SignInLoading) {
                        return Container(
                            margin:
                                const EdgeInsets.all(10.0), // Set margin here
                            child: const CircularProgressIndicator());
                      } else if (state is SignInError) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  child: const Text('Login'),
                                  onPressed: () {
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    context
                                        .read<SignInBloc>()
                                        .add(SignInButtonTab(email, password));
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [Text("errorrr ${state.error}")],
                            )
                          ],
                        );
                      }
                      return ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          String email = emailController.text;
                          String password = passwordController.text;
                          context
                              .read<SignInBloc>()
                              .add(SignInButtonTab(email, password));
                        },
                      );
                    },
                  ),
                ],
              )),
        );
      });
}
