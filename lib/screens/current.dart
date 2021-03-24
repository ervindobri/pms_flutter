import 'package:flutter_projects/screens/consultations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentScreen extends StatefulWidget {
  final Widget screen;

  const CurrentScreen({Key? key, required this.screen}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CurrentScreen> {
  Widget currentScreen = ConsulationScreen();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.screen;
  }
}