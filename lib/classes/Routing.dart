import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postal_codes/screens/HomeScreen.dart';
import 'package:postal_codes/screens/SplashScreen.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
