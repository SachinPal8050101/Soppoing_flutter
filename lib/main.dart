import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/main_app.dart';
import 'package:shopping_flutter/presentation/screens/home/bloc/home_bloc.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/common_bloc/customer_profile_bloc/customer_profile_bloc.dart';
import 'package:shopping_flutter/presentation/screens/product_detailes_screen/product_details.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => CustomerProfileBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainApp(),
      routes: {
        '/Product_Details': (context) => const ProductDetailes(
              productId: 's',
            ),
      },
      // routes: {
      //   '/Product_Detailes': (context) => MultiBlocProvider(
      //         providers: [
      //           BlocProvider<SignInBloc>.value(
      //             value: BlocProvider.of<SignInBloc>(context),
      //           ),
      //           BlocProvider<CustomerProfileBloc>.value(
      //             value: BlocProvider.of<CustomerProfileBloc>(context),
      //           ),
      //         ],
      //         child: const ProductDetailes(productId: 's'),
      //       ),
      // },
    );
  }
}
