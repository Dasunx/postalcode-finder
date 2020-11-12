import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postal_codes/classes/Constants.dart';

Widget buildSearch(FocusNode myFocusNode, String hintText, Function onChange,
    TextEditingController myCon, bool isDarkTheme) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
      child: CupertinoTextField(
        padding: EdgeInsets.all(15),
        autofocus: false,
        controller: myCon,
        focusNode: myFocusNode,
        onChanged: onChange,
        clearButtonMode: OverlayVisibilityMode.editing,
        placeholder: "Search your city",
        prefix: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(CupertinoIcons.search),
        ),
        prefixMode: OverlayVisibilityMode.notEditing,
        decoration: BoxDecoration(
          color: !isDarkTheme ? Colors.black12 : Colors.white12,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        // decoration: InputDecoration(
        //   filled: true,
        //   fillColor: Colors.white12,
        //   labelText: "Search",
        //   hintText: hintText,
        //   prefixIcon: Icon(
        //     Icons.search,
        //     color: Colors.grey,
        //   ),
        //   border: new OutlineInputBorder(
        //     // borderSide: BorderSide(color: Colors.black12, width: 1),
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.white12,
        //       width: 1.0,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(
        //         10.0,
        //       ),
        //     ),
        //   ),
        //   focusedBorder: new OutlineInputBorder(
        //     borderRadius: new BorderRadius.circular(
        //       10.0,
        //     ),
        //     borderSide: BorderSide(
        //       color: Colors.white12,
        //       width: 2.0,
        //     ),
        //   ),
        // ),
      ),
    ),
  );
}
