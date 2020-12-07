import 'dart:math';

import 'package:FlutterProjects/constants/GlobalVariables.dart';
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsulationScreen extends StatefulWidget {
  @override
  _ConsulationScreenState createState() => _ConsulationScreenState();
}

class _ConsulationScreenState extends State<ConsulationScreen> {

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          children: [
            Container(
              width: _width,
              height: max(_height/20, 60),
              color: ThemeColors.oliveLighter.withOpacity(.5),
              child: Center(
                child: Text(
                  "here comes the upper menu"
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: min(_width/4, 300),
                    height: _height - max(_height/20, 60),
                    color: ThemeColors.oliveLighter.withOpacity(.3),
                    child: Center(
                      child: displayPatientInfo(GlobalVariables.dummyPatients[0])
                      ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  displayPatientInfo(Patient patient) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://vdm.dermatoscope.ro/web/image?model=eo.vdm.appointment&id=115&field=patient_image&unique=20200729125456"
                      ),
                      backgroundColor: Colors.white,
                      minRadius: 30,
                      maxRadius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.firstName  + " " + patient.lastName,
                            style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                          ),
                        ),
                        Text(
                          patient.birthDate.toString(),
                          style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          patient.sex.toString(),
                          style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Personal information",
                          style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cod asigurat",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              patient.pid.toString(),
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              patient.age.toString(),
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Occupation",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              patient.occupation.toString(),
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Job address",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              patient.jobAddress.toString(),
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Education level",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              patient.educationLevel ?? "None",
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                            "Contact information",
                          style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      patient.address.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.greyTextColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      patient.city.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.greyTextColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      patient.state.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.greyTextColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      patient.zipCode.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.greyTextColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      patient.country.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.greyTextColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mobile phone",
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  patient.phone.toString(),
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Fax",
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  patient.fax.toString(),
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Email",
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  patient.email.toString(),
                                  style: GoogleFonts.lato(
                                    color: ThemeColors.greyTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
