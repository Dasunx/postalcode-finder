import 'dart:convert';

import 'package:flutter/services.dart';

class Province {
  String name;
  String tpCode;

  Province();
  Province.fromJson(Map<String, dynamic> json) : name = json['province'];

  Future<List<Province>> loadJson() async {
    List<Province> tempProvince = List<Province>();
    String data =
        await rootBundle.loadString('assets/data/ceylon_postals.json');
    var jsonResult = json.decode(data);
    jsonResult["provinces"].forEach((e) {
      tempProvince.add(Province.fromJson(e));
    });
    return tempProvince;
  }
}
