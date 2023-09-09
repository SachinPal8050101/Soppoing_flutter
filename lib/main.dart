import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/common/status_bar.dart';
import 'package:shopping_flutter/presentation/screens/products_screen.dart';
import 'package:shopping_flutter/logic/cubits/product_cubit/product_cubit.dart';
import 'package:shopping_flutter/logic/cubits/single_product_cubit/single_product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => SingleProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const CustomeStatusBar(),
          body: const ProductGridState(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Image.network(
                  'https://gumlet.assettype.com/afaqs%2F2021-01%2F15f5f827-8e29-4520-af8d-a0f353b8da17%2Fimages.png?auto=format%2Ccompress&w=1200',
                  height: 23,
                  width: 23,
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
