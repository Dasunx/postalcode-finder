import 'package:flutter/material.dart';
import 'package:postal_codes/classes/Constants.dart';

Widget buildSearch(FocusNode myFocusNode, String hintText, Function onChange,
    TextEditingController myCon) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 5, left: 40, right: 40),
      child: TextField(
        autofocus: false,
        controller: myCon,
        focusNode: myFocusNode,
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: hintText,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kMainColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: kMainColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    ),
  );
}
