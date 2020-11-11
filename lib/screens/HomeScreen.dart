import 'package:flutter/material.dart';
import 'package:postal_codes/classes/DarkThemeProvider.dart';
import 'package:postal_codes/classes/PostalCodes.dart';
import 'package:postal_codes/classes/Province.dart';
import 'package:postal_codes/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List<Province> provinces;
  static const String id = 'home_screen';

  const HomeScreen({Key key, this.provinces}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Province> provincesList;
  @override
  void initState() {
    provincesList = widget.provinces;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Postal finder"),
      ),
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
