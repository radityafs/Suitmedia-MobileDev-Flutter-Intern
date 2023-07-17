import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/screens/first_screen.dart';
import 'package:suitmedia_flutter/screens/second_screen.dart';
import 'package:suitmedia_flutter/screens/third_screen.dart';
import 'package:suitmedia_flutter/utils/constants/app_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Suitmedia',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: AppScreens.firstScreen,
      routes: {
        AppScreens.firstScreen: (context) => const FirstScreen(),
        AppScreens.secondScreen: (context) => const SecondScreen(),
        AppScreens.thirdScreen: (context) => const ThirdScreen(),
      },
    );
  }
}
