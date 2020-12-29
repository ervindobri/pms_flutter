import 'package:flutter_projects/screens/view_example.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/home.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'constants/theme_data.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal,
            ),
          },
        ),
      ),
      // home: HomeScreen(),
      home: SwitchViewExample()
    );
  }
}
