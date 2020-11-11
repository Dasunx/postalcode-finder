import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primarySwatch: Colors.teal,
      appBarTheme: AppBarTheme(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        color: isDarkTheme ? Colors.black : Colors.teal,
        elevation: 1,
      ),
    );
  }
}
