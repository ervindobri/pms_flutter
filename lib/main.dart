
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/screens/current.dart';
import 'package:flutter_projects/tabs/menu_widget.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'constants/theme_data.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();

  late String title = 'Appointments';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff84A128, ThemeColors.colorCodes),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.vertical,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.vertical,
            ),
          },
        ),
      ),
      home: Scaffold(
          body: SliderMenuContainer(
          appBarColor: ThemeColors.vibrantGreen,
          drawerIconColor: Colors.white,
          slideDirection: SlideDirection.LEFT_TO_RIGHT,
          key: _key,
          sliderMenuOpenSize: 250,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),
          ),
          sliderMenu: MenuWidget(
            onItemClick: (title) {
              _key.currentState!.closeDrawer();
              setState(() {
                this.title = title;
              });

            },
          ),
          sliderMain: CurrentScreen(screen: GlobalVariables.menuItems[this.title].last))),
      // home: SwitchViewExample()
    );
  }
}
