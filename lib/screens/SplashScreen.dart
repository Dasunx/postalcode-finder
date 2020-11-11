import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postal_codes/classes/Constants.dart';
import 'package:postal_codes/classes/Province.dart';
import 'package:postal_codes/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Province> provinces = List<Province>();

  loadData() async {
    provinces = await Province().loadJson();
    if (provinces != null) {
      Navigator.pushReplacementNamed(context, HomeScreen.id,
          arguments: provinces);
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kMainGradient),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/search.png'),
            ),
            Text(
              "Postal code Finder",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
