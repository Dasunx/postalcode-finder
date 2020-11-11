import 'package:flutter/material.dart';

const kMainColor = Color(0xFF0093E9);
const kSecondaryColor = Color(0xFF80D0C7);

const kMainGradient = LinearGradient(
  colors: [
    kMainColor,
    kSecondaryColor,
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(0.0, 1.0),
  stops: [0.0, 0.8],
  tileMode: TileMode.mirror,
);
