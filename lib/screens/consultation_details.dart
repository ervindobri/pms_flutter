import 'dart:math';

import 'package:FlutterProjects/constants/global_variables.dart';
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/constants/translations.dart';
import 'package:FlutterProjects/models/consultation.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:FlutterProjects/tabs/general_info/consultation_info.dart';
import 'package:FlutterProjects/tabs/general_info/personal_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ConsultationDetails extends StatefulWidget {
  final Consultation consultation;

  ConsultationDetails({this.consultation});

  @override
  _ConsultationDetailsState createState() => _ConsultationDetailsState();
}

class _ConsultationDetailsState extends State<ConsultationDetails>  with TickerProviderStateMixin{
  TabController infoTabController;

  TabController exTabController;

  @override
  void initState() {
    super.initState();
    infoTabController = new TabController(length: 2, vsync: this);
    exTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    infoTabController.dispose();
    exTabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    final double headerSize = max(60,_height/30);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        width: _width,
        height: _height,
        color: Colors.grey.shade50,
        child: Row(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: headerSize,
                    width: max(_width/6, 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                      onPressed: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FaIcon(
                                    CupertinoIcons.back,
                                    color: ThemeColors.vibrantGreen,
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Consultations",
                                style: GoogleFonts.lato(
                                  decoration: TextDecoration.underline,
                                    color: ThemeColors.vibrantGreen,
                                    fontSize: 20
                              ),),
                            )
                          ],
                        )
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: max(_width/6, 300),
                        // height: _height,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: ThemeColors.greenShadow,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            displayPatientInfo(widget.consultation.patient),
                          ],
                        )

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: _width - max(_width/6, 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      displayMedicInfo(_height, _width),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: ThemeColors.radius25,
                            boxShadow: ThemeColors.greenShadow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                menuHeader(Translations.generalInformations),
                                Container(
                                  height: 50,
                                  width: (infoTabController.length)*120.0,
                                  child: TabBar(
                                    controller: infoTabController,
                                    labelStyle: TextStyle( //up to your taste
                                        fontWeight: FontWeight.w700
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label, //makes it better
                                    labelColor: ThemeColors.vibrantGreen, //Google's sweet blue
                                    unselectedLabelColor: ThemeColors.vibrantGreen, //niceish grey
                                    isScrollable: false, //up to your taste
                                    indicator: MD2Indicator( //it begins here
                                        indicatorHeight: 3,
                                        indicatorColor: ThemeColors.vibrantGreen,
                                        indicatorSize: MD2IndicatorSize.full //3 different modes tiny-normal-full
                                    ),
                                    tabs: <Widget>[
                                      Container(
                                        // width: 100,
                                        child: Tab(
                                          text: "Consultation",
                                        ),
                                      ),
                                      Container(
                                        // width: 60,
                                        child: Tab(
                                          text: "Patient",
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: _width,
                                    height: max(250, _height/4),
                                    child: TabBarView(
                                      controller: infoTabController,
                                      children: [
                                        ConsultationInfo(consultation: widget.consultation),
                                        PersonalInfo(patient: widget.consultation.patient),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: ThemeColors.radius25,
                            boxShadow: ThemeColors.greenShadow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                menuHeader(Translations.examinations),
                                Container(
                                  height: 50,
                                  width: (exTabController.length)*120.0,
                                  child: TabBar(
                                    controller: exTabController,
                                    labelStyle: TextStyle( //up to your taste
                                        fontWeight: FontWeight.w700
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label, //makes it better
                                    labelColor: ThemeColors.vibrantGreen, //Google's sweet blue
                                    unselectedLabelColor: ThemeColors.vibrantGreen, //niceish grey
                                    isScrollable: false, //up to your taste
                                    indicator: MD2Indicator( //it begins here
                                        indicatorHeight: 3,
                                        indicatorColor: ThemeColors.vibrantGreen,
                                        indicatorSize: MD2IndicatorSize.full //3 different modes tiny-normal-full
                                    ),
                                    tabs: <Widget>[
                                      Container(
                                        // width: 100,
                                        child: Tab(
                                          text: "Clinical",
                                        ),
                                      ),
                                      Container(
                                        // width: 60,
                                        child: Tab(
                                          text: "Paraclinical",
                                        ),
                                      ),
                                      Container(
                                        // width: 60,
                                        child: Tab(
                                          text: "Local",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: _width,
                                    height: 300,
                                    child: TabBarView(
                                      controller: exTabController,
                                      children: [
                                        ConsultationInfo(consultation: widget.consultation),
                                        ConsultationInfo(consultation: widget.consultation),
                                        ConsultationInfo(consultation: widget.consultation),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  displayPatientInfo(Patient patient) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 15, left: 10, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Patient info",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: ThemeColors.lightVibrantGreenColor,
                      fontWeight: FontWeight.w700
                    )
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: ThemeColors.radius15
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ThemeColors.vibrantGreen.withOpacity(.3),
                            borderRadius: ThemeColors.radius15
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    color: ThemeColors.vibrantGreen,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.userInjured,
                                        color: CupertinoColors.white,
                                      ),
                                    )
                                  ),
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
                                        color: ThemeColors.vibrantGreen,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23,
                                      ),
                                    ),
                                    Text(
                                      patient.birthDate.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.vibrantGreen,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      patient.sex.toString(),
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.vibrantGreen,
                                        fontWeight: FontWeight.w400,
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
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "Personal information",
                                      style: GoogleFonts.lato(
                                        color: ThemeColors.lightVibrantGreenColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  infoRow("Patient code", patient.pid.toString()),
                                  infoRow("Age", patient.age.toString()),
                                  infoRow("Occupation", patient.occupation.toString()),
                                  infoRow("Job address", patient.jobAddress.toString()),
                                  infoRow("Education level", patient.educationLevel.toString()),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Contact information",
                                    style: GoogleFonts.lato(
                                      color: ThemeColors.lightVibrantGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                infoRow("Address", patient.address + "," + patient.country  +"," + patient.city),
                                infoRow("Mobile phone",patient.phone),
                                infoRow("Fax",patient.fax),
                                infoRow("Email address",patient.email)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: FlatButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: ThemeColors.radius15
                    ),
                    onPressed: () => null,
                    color: ThemeColors.vibrantGreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.edit,
                          color: CupertinoColors.white,
                          size: 20,
                        ),
                        Text(
                          "Edit patient",
                          style: ThemeColors.mediumWhiteStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  infoRow(String title, String subtitle){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              color: ThemeColors.greyTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.lato(
              color: ThemeColors.greyTextColor,
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  menuHeader(String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Text(
            s,
            style: GoogleFonts.lato(
                fontSize: 25,
                color: ThemeColors.lightVibrantGreenColor,
              fontWeight: FontWeight.w700
            ),
          ),
      ),
    );
  }

  displayMedicInfo(double _height, double _width) {
    return Container(
      height: max(210, _height/15),
      width: _width,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: ThemeColors.radius25,
        boxShadow: ThemeColors.greyShadow
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeColors.vibrantGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              )
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: ThemeColors.radius15
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.userMd,
                            color: ThemeColors.lightVibrantGreenColor.withOpacity(.7),
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                widget.consultation.medic.fullName(),
                                style: ThemeColors.bigWhiteStyle
                            ),
                            Text(
                                widget.consultation.medic.specialty,
                                style: ThemeColors.mediumWhiteStyle
                            ),
                            Text(
                                widget.consultation.medic.address,
                                style: ThemeColors.mediumWhiteStyle
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            child: FlatButton(
                              onPressed: () {  },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              color: ThemeColors.lightVibrantGreenColor,
                              splashColor: ThemeColors.lightVibrantGreenColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            child: FlatButton(
                              onPressed: () {  },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              color: ThemeColors.lightVibrantGreenColor,
                              splashColor: ThemeColors.lightVibrantGreenColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.mobile,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            child: FlatButton(
                              onPressed: () {  },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              color: ThemeColors.lightVibrantGreenColor,
                              splashColor: ThemeColors.lightVibrantGreenColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidEnvelope,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    medicInfoProperty("Phone Number", widget.consultation.medic.phone),
                    medicInfoProperty("Mobile Number", widget.consultation.medic.mobilePhone),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    medicInfoProperty("Email address", widget.consultation.medic.emailAddress),
                    medicInfoProperty("Fax", widget.consultation.medic.fax),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    medicInfoProperty("Address", widget.consultation.medic.address),
                    medicInfoProperty("",""),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  medicInfoProperty(String title, String property) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                color: ThemeColors.greyTextColor.withOpacity(.6),
                fontSize: 20,
                fontWeight: FontWeight.w300
            ),
          ),
          Text(
            property,
            style: GoogleFonts.lato(
                color: ThemeColors.greyTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}
