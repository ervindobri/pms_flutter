import 'package:FlutterProjects/constants/GlobalVariables.dart';
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/screens/consultations.dart';
import 'package:FlutterProjects/screens/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidenavbar/sidenavbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  Widget currentItem = ConsulationScreen();
  bool isCollapsed = false;

  void show(Widget widget) {
    setState(() {
      currentItem = widget;
    });
  }

  createMenuItems(){
    List<NavItem> items = [];
    GlobalVariables.menuItems.forEach((key, value) {
        items.add(NavItem(
          hoverColor: ThemeColors.oliveMid,
          title: Text(
              key.toString(),
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          ),
          icon: FaIcon(
            value[0],
            color: Colors.white,
          ),
          isCollapsed: isCollapsed,
          onPressed: () {
            show(value[1]);
          },
        ));
    });
    return items;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SideBar(
        backgroundColor: ThemeColors.primaryColor,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        sideBarCollapsedWidth: 70,
        isCollapsed: isCollapsed,
        collapseIcon: CollapseIcon(
          isCollapsed: isCollapsed,
          icon: FaIcon(
            FontAwesomeIcons.arrowAltCircleLeft,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isCollapsed = !isCollapsed;
            });
          },
        ),
        currentItem: currentItem,
        navItems: createMenuItems()
      ),
    );
  }
}