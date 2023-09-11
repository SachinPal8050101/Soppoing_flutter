import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc_event.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_cubit.dart';

void showModalBottomSheets(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {

          if (state is AuthLoaded){
               CustomerCubit customerCubit = BlocProvider.of<CustomerCubit>(context);
              customerCubit.getCustomerProfile(state.token);
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
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(Login('sachin.kumar1@sdaffodilsw.com', 'Sachin@sdsds12'));
                    },
                  ),
                ],
              ));
        },
      );
    },
  );
}
