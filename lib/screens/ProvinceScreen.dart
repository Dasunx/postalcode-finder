import 'package:flutter/material.dart';
import 'package:postal_codes/classes/Province.dart';

class ViewProvince extends StatefulWidget {
  static const String id = 'view_province';
  final Province province;

  const ViewProvince({Key key, this.province}) : super(key: key);
  @override
  _ViewProvinceState createState() => _ViewProvinceState();
}

class _ViewProvinceState extends State<ViewProvince> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.province.name,
        ),
      ),
    );
  }
}
