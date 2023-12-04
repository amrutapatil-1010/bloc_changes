import 'package:bloc_updates/screens/home_screen.dart';
import 'package:bloc_updates/screens/second_screen.dart';
import 'package:bloc_updates/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings settings) {
    // switch (settings.name) {
    //   case "/":
    //     return MaterialPageRoute(
    //       builder: (_) =>  const HomeScreen(title: "abc",),
    //     );
    // }
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'Home screen',
                ));
        break;
      case '/second':
        MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: 'Second screen',
                ));
        break;

      case '/third':
        MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: 'Third screen',
                ));
    }
  }
}
