import 'package:flutter/material.dart';
import 'package:postal_codes/classes/DarkThemeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            themeChange.darkTheme = !themeChange.darkTheme;
          },
          child: Text("click me"),
        ),
      ),
    );
  }
}
