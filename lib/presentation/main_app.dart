import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_flutter/presentation/screens/home/home.dart';
import 'package:shopping_flutter/presentation/screens/profile_screen/profile_screen.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:shopping_flutter/presentation/screens/sign_in_screen/bloc/sign_in_event.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children = [
      const Home(),
      CustomerProfile(onTabTapped: (index) => _onTabTapped(index)),
    ];
  }

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    context.read<SignInBloc>().add(AppStartEvent());
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _children,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
