import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:postal_codes/classes/PostalCodes.dart';

class Province {
  String name;
  String tpCode;
  String image;
  int count;
  List<PostalCodes> postalCodes;

  Province();
  Province.fromJson(Map<String, dynamic> json)
      : name = json['province'],
        image = json['image'],
        count = json['towns'].length,
        postalCodes = [];

  Future<List<Province>> loadJson() async {
    List<Province> tempProvince = List<Province>();
    String data =
        await rootBundle.loadString('assets/data/ceylon_postals.json');
    var jsonResult = json.decode(data);
    jsonResult["provinces"].forEach((e) async {
      Province tp = Province.fromJson(e);
      tp.postalCodes = await loadCodes(e['towns']);

      tempProvince.add(tp);
    });
    return tempProvince;
  }

  Future<List<PostalCodes>> loadCodes(List towns) async {
    List<PostalCodes> tempList = List<PostalCodes>();
    towns.forEach((element) {
      tempList.add(PostalCodes.fromJson(element));
    });
    return tempList;
  }
}
