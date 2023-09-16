import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/home/home.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/newArchitecture/presentation/screens/sign_in_screen/bloc/sign_in_event.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SignInBloc>().add(AppStartEvent());
    return const Scaffold(
      body: Home(),
    );
  }
}
