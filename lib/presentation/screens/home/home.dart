import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/screens/home/bloc/home_bloc.dart';
import 'package:shopping_flutter/presentation/common_widgets/home_status_bar.dart';
import 'package:shopping_flutter/presentation/common_widgets/product_container.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_event.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_state.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_state.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_event.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeFetchProductevent());
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInDone) {
          context.read<CustomerProfileBloc>().add(CustomerFetchProfileEvent());
        }
      },
      builder: (context, state) {
        return BlocConsumer<CustomerProfileBloc, CustomerProfileState>(
          listener: (context, state) {
            if (state is CustomerProfileErrorState) {
              context.read<SignInBloc>().add(SignOutEvent());
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: const HomeStatusBar(),
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeProductSuccess) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductContainer(
                          product: state.products[index],
                        );
                      },
                    );
                  } else if (state is HomeProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeProductFailure) {
                    return Center(
                      child: Text(state.error.toString()),
                    );
                  } else {
                    return const Center(child: Text("Something went wrong =>"));
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
