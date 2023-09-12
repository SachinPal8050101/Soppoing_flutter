import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/routes.dart';
import 'package:shopping_flutter/utils/secure_storage.dart';
import 'package:shopping_flutter/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopping_flutter/presentation/common/status_bar.dart';
import 'package:shopping_flutter/presentation/screens/products_screen.dart';
import 'package:shopping_flutter/logic/bloc/customer_bloc/customer_bloc.dart';
import 'package:shopping_flutter/logic/cubits/product_cubit/product_cubit.dart';
import 'package:shopping_flutter/logic/cubits/customer_cubit/customer_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 late final CustomerCubit custCubit;
  Future<String?> getAccessToken() async {
    String? val = await SecureStorage.getKeyByName('token');
    return val;
  }

  @override
  void initState() {
    custCubit = CustomerCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getAccessToken(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));  // or your custom loader
        } else {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => custCubit,
              ),
              BlocProvider(
                create: (context) => AuthBloc(),
              ),
               BlocProvider(
                create: (context) => CustomerBloc(custCubit: custCubit),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
              home: Scaffold(
                appBar: const CustomeStatusBar(),
                body: BlocProvider(
                  create: (context) => ProductCubit(),
                  child: const ProductGridState(),
                ),
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
      },
    );
  }
}