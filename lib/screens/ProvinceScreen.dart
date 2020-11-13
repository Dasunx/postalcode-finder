// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:postal_codes/classes/Constants.dart';
// import 'package:postal_codes/classes/DarkThemeProvider.dart';
// import 'package:postal_codes/classes/PostalCodes.dart';
// import 'package:postal_codes/classes/Province.dart';
// import 'package:postal_codes/components/SearchBar.dart';
// import 'package:provider/provider.dart';
//
// class ViewProvince extends StatefulWidget {
//   static const String id = 'view_province';
//   final Province province;
//
//   const ViewProvince({Key key, this.province}) : super(key: key);
//   @override
//   _ViewProvinceState createState() => _ViewProvinceState();
// }
//
// class _ViewProvinceState extends State<ViewProvince> {
//   List<PostalCodes> postalCodes = List<PostalCodes>();
//   FocusNode myFocusNode = new FocusNode();
//   TextEditingController textEditingController = new TextEditingController();
//   @override
//   void initState() {
//     postalCodes.addAll(widget.province.postalCodes);
//
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//     ));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     final themeChange = Provider.of<DarkThemeProvider>(context);
//     return GestureDetector(
//       onTap: () {
//         myFocusNode.unfocus();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Expanded(
//                   flex: MediaQuery.of(context).orientation ==
//                           Orientation.landscape
//                       ? 8
//                       : 7,
//                   child: Hero(
//                     tag: widget.province.name,
//                     child: InteractiveViewer(
//                       //boundaryMargin: EdgeInsets.all(20.0),
//                       minScale: 1,
//                       maxScale: 2,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: themeChange.darkTheme
//                               ? kMainColor
//                               : kSecondaryColor,
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 'assets/images/${widget.province.image}'),
//                             fit: BoxFit.cover,
//                             // colorFilter: new ColorFilter.mode(
//                             //     Colors.white.withOpacity(0.8),
//                             //     BlendMode.luminosity),
//                           ),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             topRight: Radius.circular(12),
//                           ),
//                         ),
//                         // margin: EdgeInsets.all(5),
//                         width: width,
//                         height: height / 5,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                       child: Center(
//                           child: Text(
//                     "${widget.province.name} province",
//                     style: TextStyle(fontSize: 24),
//                   ))),
//                 ),
//                 Expanded(
//                   flex: 12,
//                   child: OrientationBuilder(
//                     builder: (context, orientation) {
//                       return GridView.count(
//                         crossAxisCount: MediaQuery.of(context).orientation ==
//                                 Orientation.portrait
//                             ? 2
//                             : 4,
//                         children: List.generate(
//                           postalCodes.length,
//                           (index) {
//                             return Hero(
//                               tag: postalCodes[index].town,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: themeChange.darkTheme
//                                       ? kMainColor
//                                       : kSecondaryColor,
//                                   // image: DecorationImage(
//                                   //   image: AssetImage(
//                                   //       'assets/images/${widget.province.image}'),
//                                   //   fit: BoxFit.cover,
//                                   //   // colorFilter: new ColorFilter.mode(
//                                   //   //     Colors.white.withOpacity(0.8),
//                                   //   //     BlendMode.luminosity),
//                                   // ),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     topRight: Radius.circular(12),
//                                   ),
//                                 ),
//                                 margin: EdgeInsets.only(
//                                     left: 5, right: 5, bottom: 10),
//                                 width: width / 2,
//                                 height: height / 4,
//                                 child: Column(
//                                   children: [
//                                     Expanded(
//                                       flex: 4,
//                                       child: Container(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Flexible(
//                                               child: Text(
//                                                 postalCodes[index].town,
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(12),
//                                             topRight: Radius.circular(12),
//                                           ),
//                                           // gradient: kMainGradient,
//                                           // image: DecorationImage(
//                                           //     image: AssetImage(
//                                           //         'assets/images/${provincesList[index].image}'),
//                                           //     fit: BoxFit.cover),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 2,
//                                       child: Container(
//                                         padding: EdgeInsets.all(5),
//                                         color: themeChange.darkTheme
//                                             ? Colors.black.withOpacity(0.8)
//                                             : Colors.blue.withOpacity(0.8),
//                                         width: width,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "${postalCodes[index].code}",
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: 40,
//               left: 15,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios,
//                   size: 30.0,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 35,
//               left: 30,
//               child: Container(
//                 width: width - 30,
//                 child: buildSearch(
//                   myFocusNode,
//                   "මහනුවර",
//                   (s) {
//                     print(s);
//                   },
//                   textEditingController,
//                   themeChange.darkTheme,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postal_codes/classes/Constants.dart';
import 'package:postal_codes/classes/DarkThemeProvider.dart';
import 'package:postal_codes/classes/PostalCodes.dart';
import 'package:postal_codes/classes/Province.dart';
import 'package:postal_codes/components/SearchBar.dart';
import 'package:provider/provider.dart';

class ViewProvince extends StatefulWidget {
  static const String id = 'view_province';
  final Province province;

  const ViewProvince({Key key, this.province}) : super(key: key);
  @override
  _ViewProvinceState createState() => _ViewProvinceState();
}

class _ViewProvinceState extends State<ViewProvince> {
  List<PostalCodes> fullList = List<PostalCodes>();
  List<PostalCodes> postalCodes = List<PostalCodes>();
  FocusNode myFocusNode = new FocusNode();
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    //fullList.addAll(widget.province.postalCodes);
    postalCodes.addAll(widget.province.postalCodes);
    fullList.addAll(postalCodes);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  void filterResult(String query) {
    if (query.isNotEmpty) {
      List<PostalCodes> filteredList = List<PostalCodes>();
      fullList.forEach((element) {
        if (element.town.toLowerCase().contains(query.toLowerCase()) ||
            element.code.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(element);
        }
      });
      if (mounted) {
        setState(() {
          postalCodes.clear();
          postalCodes.addAll(filteredList);
        });
      }
      return;
    } else {
      if (mounted) {
        setState(() {
          postalCodes.clear();
          postalCodes.addAll(fullList);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        myFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              // Provide a standard title.
              title: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: buildSearch(
                  myFocusNode,
                  fullList[0 + Random().nextInt(4 - 0)].town,
                  (query) {
                    filterResult(query);
                  },
                  textEditingController,
                  themeChange.darkTheme,
                ),
              ),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              pinned: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: InteractiveViewer(
                //boundaryMargin: EdgeInsets.all(20.0),
                minScale: 1,
                maxScale: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        themeChange.darkTheme ? kMainColor : kSecondaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${widget.province.image}'),
                      fit: BoxFit.cover,
                      // colorFilter: new ColorFilter.mode(
                      //     Colors.white.withOpacity(0.8),
                      //     BlendMode.luminosity),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  // margin: EdgeInsets.all(5),
                  width: width,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        //width: width,
                        color: kMainColor.withOpacity(0.8),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "${tr("province")} - ${tr(widget.province.name)}",
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 250,
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
              ),
              delegate: SliverChildBuilderDelegate(
                // displays the index of the current item.
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: themeChange.darkTheme
                          ? kMainColor
                          : kSecondaryColor,
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //       'assets/images/${widget.province.image}'),
                      //   fit: BoxFit.cover,
                      //   // colorFilter: new ColorFilter.mode(
                      //   //     Colors.white.withOpacity(0.8),
                      //   //     BlendMode.luminosity),
                      // ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    margin: EdgeInsets.all(5),
                    width: width / 2,
                    height: height / 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    postalCodes[index].town,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              // gradient: kMainGradient,
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //         'assets/images/${provincesList[index].image}'),
                              //     fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: themeChange.darkTheme
                                ? Colors.black.withOpacity(0.8)
                                : Colors.blue.withOpacity(0.8),
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${postalCodes[index].code}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                // Builds 1000 ListTiles
                childCount: postalCodes.length,
              ),
            )
          ],
          // child: Stack(
          //   children: [
          //     Column(
          //       children: [
          //         Expanded(
          //           flex: MediaQuery.of(context).orientation ==
          //                   Orientation.landscape
          //               ? 8
          //               : 7,
          //           child: Hero(
          //             tag: widget.province.name,
          //             child: InteractiveViewer(
          //               //boundaryMargin: EdgeInsets.all(20.0),
          //               minScale: 1,
          //               maxScale: 2,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: themeChange.darkTheme
          //                       ? kMainColor
          //                       : kSecondaryColor,
          //                   image: DecorationImage(
          //                     image: AssetImage(
          //                         'assets/images/${widget.province.image}'),
          //                     fit: BoxFit.cover,
          //                     // colorFilter: new ColorFilter.mode(
          //                     //     Colors.white.withOpacity(0.8),
          //                     //     BlendMode.luminosity),
          //                   ),
          //                   borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12),
          //                   ),
          //                 ),
          //                 // margin: EdgeInsets.all(5),
          //                 width: width,
          //                 height: height / 5,
          //               ),
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           flex: 2,
          //           child: Container(
          //               child: Center(
          //                   child: Text(
          //             "${widget.province.name} province",
          //             style: TextStyle(fontSize: 24),
          //           ))),
          //         ),
          //         Expanded(
          //           flex: 12,
          //           child: OrientationBuilder(
          //             builder: (context, orientation) {
          //               return GridView.count(
          //                 crossAxisCount: MediaQuery.of(context).orientation ==
          //                         Orientation.portrait
          //                     ? 2
          //                     : 4,
          //                 children: List.generate(
          //                   postalCodes.length,
          //                   (index) {
          //                     return Hero(
          //                       tag: postalCodes[index].town,
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                           color: themeChange.darkTheme
          //                               ? kMainColor
          //                               : kSecondaryColor,
          //                           // image: DecorationImage(
          //                           //   image: AssetImage(
          //                           //       'assets/images/${widget.province.image}'),
          //                           //   fit: BoxFit.cover,
          //                           //   // colorFilter: new ColorFilter.mode(
          //                           //   //     Colors.white.withOpacity(0.8),
          //                           //   //     BlendMode.luminosity),
          //                           // ),
          //                           borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(12),
          //                             topRight: Radius.circular(12),
          //                           ),
          //                         ),
          //                         margin: EdgeInsets.only(
          //                             left: 5, right: 5, bottom: 10),
          //                         width: width / 2,
          //                         height: height / 4,
          //                         child: Column(
          //                           children: [
          //                             Expanded(
          //                               flex: 4,
          //                               child: Container(
          //                                 child: Row(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.center,
          //                                   children: [
          //                                     Flexible(
          //                                       child: Text(
          //                                         postalCodes[index].town,
          //                                         textAlign: TextAlign.center,
          //                                         style: TextStyle(
          //                                             fontSize: 20,
          //                                             fontWeight:
          //                                                 FontWeight.w600),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                                 decoration: BoxDecoration(
          //                                   borderRadius: BorderRadius.only(
          //                                     topLeft: Radius.circular(12),
          //                                     topRight: Radius.circular(12),
          //                                   ),
          //                                   // gradient: kMainGradient,
          //                                   // image: DecorationImage(
          //                                   //     image: AssetImage(
          //                                   //         'assets/images/${provincesList[index].image}'),
          //                                   //     fit: BoxFit.cover),
          //                                 ),
          //                               ),
          //                             ),
          //                             Expanded(
          //                               flex: 2,
          //                               child: Container(
          //                                 padding: EdgeInsets.all(5),
          //                                 color: themeChange.darkTheme
          //                                     ? Colors.black.withOpacity(0.8)
          //                                     : Colors.blue.withOpacity(0.8),
          //                                 width: width,
          //                                 child: Row(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.center,
          //                                   children: [
          //                                     Text(
          //                                       "${postalCodes[index].code}",
          //                                       style: TextStyle(
          //                                           fontSize: 20,
          //                                           fontWeight:
          //                                               FontWeight.w600),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //     Positioned(
          //       top: 40,
          //       left: 15,
          //       child: IconButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         icon: Icon(
          //           Icons.arrow_back_ios,
          //           size: 30.0,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: 35,
          //       left: 30,
          //       child: Container(
          //         width: width - 30,
          //         child: buildSearch(
          //           myFocusNode,
          //           "මහනුවර",
          //           (s) {
          //             print(s);
          //           },
          //           textEditingController,
          //           themeChange.darkTheme,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
