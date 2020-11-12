import 'dart:convert';

import 'package:flutter/services.dart';

class PostalCodes {
  String town;
  String code;

  PostalCodes();

  PostalCodes.fromJson(Map<String, dynamic> json)
      : town = json["town"],
        code = json["postal_code"];
}
