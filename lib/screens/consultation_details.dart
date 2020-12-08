import 'dart:math';

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
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          children: [
            Container(
              color: ThemeColors.oliveLighter,
              height: headerSize,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                      color: Colors.transparent,
                      splashColor: ThemeColors.oliveLight,
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                  CupertinoIcons.back,
                                  color: Colors.white,
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Consultations",
                              style: GoogleFonts.lato(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontSize: 20
                            ),),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: _width,
              height: _height - headerSize,
              child: Row(
                children: [
                  Container(
                    width: max(_width/6, 300),
                    height: _height,
                    decoration: BoxDecoration(
                      color: ThemeColors.oliveLighter.withOpacity(.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        displayPatientInfo(widget.consultation.patient),
                      ],
                    )

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
                              padding: const EdgeInsets.symmetric(vertical: 25.0),
                              child: Container(
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
                                        labelColor: ThemeColors.oliveLight, //Google's sweet blue
                                        unselectedLabelColor: ThemeColors.oliveLighter, //niceish grey
                                        isScrollable: false, //up to your taste
                                        indicator: MD2Indicator( //it begins here
                                            indicatorHeight: 3,
                                            indicatorColor: ThemeColors.oliveMid,
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
                                        height: max(300, _height/4),
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
                            Divider(
                              color: ThemeColors.oliveLighter,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25.0),
                              child: Container(
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
                                        labelColor: ThemeColors.oliveLight, //Google's sweet blue
                                        unselectedLabelColor: ThemeColors.oliveLighter, //niceish grey
                                        isScrollable: false, //up to your taste
                                        indicator: MD2Indicator( //it begins here
                                            indicatorHeight: 3,
                                            indicatorColor: ThemeColors.oliveMid,
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
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayPatientInfo(Patient patient) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
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
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              patient.sex.toString(),
                              style: GoogleFonts.lato(
                                color: ThemeColors.greyTextColor,
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
                                  color: ThemeColors.oliveMid,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: ThemeColors.oliveMid,
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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Contact information",
                              style: GoogleFonts.lato(
                                color: ThemeColors.oliveMid,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: ThemeColors.oliveMid,
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
                color: ThemeColors.oliveDark,
              fontWeight: FontWeight.w700
            ),
          ),
      ),
    );
  }

  displayMedicInfo(double _height, double _width) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
      ),
      elevation: 6,
      color: Colors.white,
      child: Container(
        height: max(200, _height/15),
        width: _width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: ThemeColors.erondGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                )
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.userMd,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.infoCircle,
                          color: ThemeColors.greyTextColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Medic info",
                          style: GoogleFonts.lato(
                            color: ThemeColors.greyTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.consultation.medic.fullName(),
                                style: ThemeColors.bigDarkStyle
                            ),
                            Text(
                              widget.consultation.medic.address,
                              style: ThemeColors.mediumDarkStyle
                            ),
                            Text(
                              widget.consultation.medic.address,
                              style: ThemeColors.mediumDarkStyle
                            ),
                          ],
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
                          child: FlatButton(
                            onPressed: () {  },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: ThemeColors.erondGreen,
                            splashColor: ThemeColors.oliveDark,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        widget.consultation.medic.phone,
                                        style: ThemeColors.mediumWhiteStyle
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {  },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: ThemeColors.erondGreen,
                            splashColor: ThemeColors.oliveDark,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.mobile,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                      widget.consultation.medic.mobilePhone,
                                      style: ThemeColors.mediumWhiteStyle
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {  },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: ThemeColors.erondGreen,
                            splashColor: ThemeColors.eronOliveDark,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidEnvelope,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        widget.consultation.medic.emailAddress,
                                        style: ThemeColors.mediumWhiteStyle
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
