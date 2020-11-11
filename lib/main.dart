import 'package:flutter/material.dart';
import 'package:postal_codes/classes/Routing.dart';
import 'package:postal_codes/classes/Themes.dart';
import 'package:postal_codes/screens/HomeScreen.dart';
import 'package:postal_codes/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'classes/DarkThemeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Widgets',
            theme: Themes.themeData(themeChangeProvider.darkTheme, context),
            onGenerateRoute: Routing.generateRoute,
            initialRoute: SplashScreen.id,
          );
        },
      ),
    );
  }
}
