import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postal_codes/screens/HomeScreen.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
