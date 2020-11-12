import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postal_codes/classes/Constants.dart';
import 'package:postal_codes/classes/DarkThemeProvider.dart';
import 'package:postal_codes/classes/PostalCodes.dart';
import 'package:postal_codes/classes/Province.dart';
import 'package:postal_codes/components/SearchBar.dart';
import 'package:postal_codes/screens/ProvinceScreen.dart';
import 'package:postal_codes/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List<Province> provinces;
  static const String id = 'home_screen';

  const HomeScreen({Key key, this.provinces}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Province> fullList = List<Province>();
  List<Province> provincesList = List<Province>();
  FocusNode myFocusNode = new FocusNode();
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    fullList = widget.provinces;
    provincesList.addAll(fullList);
    super.initState();
  }

  void filterResult(String query) {
    if (query.isNotEmpty) {
      List<Province> filteredList = List<Province>();
      fullList.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(element);
        }
      });
      if (mounted) {
        setState(() {
          provincesList.clear();
          provincesList.addAll(filteredList);
        });
      }
      return;
    } else {
      if (mounted) {
        setState(() {
          provincesList.clear();
          provincesList.addAll(fullList);
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 2
                        : 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: [
                      Text(
                        "Postal codes",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.alata().fontFamily,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          color: themeChange.darkTheme
                              ? Colors.yellow
                              : Colors.black,
                          icon: Transform.rotate(
                            angle: 180 * pi / 180,
                            child: Icon(
                              themeChange.darkTheme
                                  ? CupertinoIcons.lightbulb_fill
                                  : CupertinoIcons.lightbulb_slash_fill,
                            ),
                          ),
                          onPressed: () {
                            themeChange.darkTheme = !themeChange.darkTheme;
                          })
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 1,
                  child: buildSearch(myFocusNode, "මහනුවර", (query) {
                    filterResult(query);
                  }, textEditingController, themeChange.darkTheme)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Provinces",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                flex: 10,
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    return GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 4,
                        children: List.generate(provincesList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ViewProvince.id,
                                  arguments: provincesList[index]);
                            },
                            child: Hero(
                              tag: provincesList[index].name,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeChange.darkTheme
                                      ? kMainColor
                                      : kSecondaryColor,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${provincesList[index].image}'),
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
                                margin: EdgeInsets.all(5),
                                width: width / 2,
                                height: height / 4,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
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
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          color: themeChange.darkTheme
                                              ? Colors.black.withOpacity(0.8)
                                              : kSecondaryColor
                                                  .withOpacity(0.8),
                                          width: width,
                                          child: Row(
                                            children: [
                                              Text(
                                                provincesList[index].name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Spacer(),
                                              Text(
                                                "${provincesList[index].count}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
