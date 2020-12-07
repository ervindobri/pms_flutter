import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientsScreen extends StatefulWidget {
  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
            "hello patients"
        ),
      ),
    );
  }
}
