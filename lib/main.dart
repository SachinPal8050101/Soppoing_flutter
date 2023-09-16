import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/main_app.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';

void main() {
  runApp(const MyApp());
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
      home: BlocProvider(
        create: (context) => SignInBloc(),
        child: const MainApp(),
      ),
    );
  }
}
