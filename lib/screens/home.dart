import 'dart:math';

import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_projects/screens/consultations.dart';
import 'package:flutter_projects/screens/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidenavbar/sidenavbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  List<CollapsibleItem> _items;
  String _headline;
  NetworkImage _avatarImg =
  NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  Widget currentScreen = ConsulationScreen();

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    List<CollapsibleItem> items = [];
    GlobalVariables.menuItems.forEach((title, list) {
        items.add(CollapsibleItem(
          text: title,
          icon: list[0],
          onPressed: (){
          setState(() {
            _headline = title;
            currentScreen = list[1];
          });
          // Navigator.push(context, CupertinoPageRoute(builder: (_) => list[1] ));
          },
          isSelected: false,
        ));
    });
    items[0].isSelected = true;
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return CollapsibleSidebar(
            items: _items,
            title: 'VDM Manager',
            avatarImg: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
            body: _body(MediaQuery.of(context).size, context),
            height: double.infinity,
            minWidth: 80,
            maxWidth: 270,
            borderRadius: 15,
            iconSize: 40,
            // textSize: 20,
            toggleButtonIcon: Icons.chevron_right,
            selectedIconBox: ThemeColors.erondGreen.withOpacity(.5),
            backgroundColor: ThemeColors.vibrantGreen.withOpacity(.7),
            selectedIconColor: Colors.white,
            selectedTextColor: Color(0xffF3F7F7),
            unselectedIconColor: Colors.grey.shade50,
            unselectedTextColor: Colors.grey.shade100,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            screenPadding: 4,
            // showCollapseButton: true,
          );
  }
  Widget _body(Size size, BuildContext context) {
    return currentScreen;
  }
}