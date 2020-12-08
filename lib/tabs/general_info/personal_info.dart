
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  final Patient patient;


  const PersonalInfo({Key key, this.patient}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Blood type",
                    style: ThemeColors.thickDarkstyle,
                  ),
                  Text(
                    patient.bloodType,
                    style: ThemeColors.mediumDarkStyle,
                  ),
                ],
              ),
            ),
            Divider(
              color: ThemeColors.greyTextColor,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "RH Group",
                    style: ThemeColors.thickDarkstyle,
                  ),
                  Text(
                    patient.RH,
                    style: ThemeColors.mediumDarkStyle,
                  ),
                ],
              ),
            ),
            Divider(
              color: ThemeColors.greyTextColor,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Text(
                    "Diseases",
                    style: ThemeColors.thickDarkstyle,
                  ),
                  Text(
                    patient.diseases,
                    style: ThemeColors.mediumDarkStyle,
                  ),
                ],
              ),
            ),
            Divider(
              color: ThemeColors.greyTextColor,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Text(
                    "Allergies",
                    style: ThemeColors.thickDarkstyle,
                  ),
                  Text(
                    patient.allergies,
                    style: ThemeColors.mediumDarkStyle,
                  ),
                ],
              ),
            ),
            Divider(
              color: ThemeColors.greyTextColor,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
