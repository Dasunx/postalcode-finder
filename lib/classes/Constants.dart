import 'package:flutter/material.dart';

const kMainColor = Color(0xFFeeaeca);
const kSecondaryColor = Color(0xFF94bbe9);

const kMainGradient = LinearGradient(
  colors: [
    kMainColor,
    kSecondaryColor,
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(1.0, 1.0),
  stops: [0.0, 1.0],
  tileMode: TileMode.mirror,
);
