import 'dart:math';

import 'package:FlutterProjects/constants/global_variables.dart';
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/helpers/sharedaxisroute.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

import 'consultation_details.dart';

class ConsulationScreen extends StatefulWidget {
  @override
  _ConsulationScreenState createState() => _ConsulationScreenState();
}

class _ConsulationScreenState extends State<ConsulationScreen> {
  var _currentSortIndex = 0;
  bool _sortAsc = true;
  bool selected = false;

  final List<BoxShadow> greenShadow = [
    BoxShadow(
        color: ThemeColors.greyTextColor.withOpacity(.2),
        blurRadius: 40,
        spreadRadius: -5
    )];

  SharedAxisTransitionType transitionType =
      SharedAxisTransitionType.horizontal;

  Widget selectedWidget;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final radius =  BorderRadius.circular(15);


    return !selected
     ? mainList()
      : selectedWidget;
  }

  mainList(){
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final radius =  BorderRadius.circular(15);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 25),
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: _width,
                  height: max(_height/20, 60),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: ThemeColors.radius15,
                    boxShadow: greenShadow,
                  ),
                  child: Center(
                    child: Text(
                      "here comes the floating search menu with filters",
                      style: ThemeColors.thickDarkstyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: greenShadow

                  ),
                  child: ClipRRect(
                    borderRadius: radius,
                    child: Container(
                      width: _width,
                      decoration: BoxDecoration(
                          borderRadius: radius,
                          color: CupertinoColors.white,
                          boxShadow: greenShadow
                      ),
                      child:DataTable(
                        sortColumnIndex: _currentSortIndex,
                        sortAscending: _sortAsc,
                        dataRowHeight: 65,
                        headingTextStyle: ThemeColors.thickLightStyle,
                        headingRowHeight: 100,
                        showBottomBorder: true,
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                                'Date',
                                style: ThemeColors.thickDarkstyle,
                              ),
                              onSort: (columnIndex, sortAscending){

                                setState(() {
                                  _currentSortIndex = columnIndex;
                                  _sortAsc = sortAscending;
                                  GlobalVariables.dummyConsultations.sort((a, b) => a.date.compareTo(b.date));
                                  if (!sortAscending) {
                                    GlobalVariables.dummyConsultations = GlobalVariables.dummyConsultations.reversed.toList();
                                  }
                                });
                              }
                          ),
                          DataColumn(
                            label: Text('Duration', style: ThemeColors.thickDarkstyle,),
                            onSort: (columnIndex, sortAscending) {
                              setState(() {
                                _currentSortIndex = columnIndex;
                                _sortAsc = sortAscending;

                                GlobalVariables.dummyConsultations.sort((a, b) => a.duration.toLowerCase().compareTo(b.duration.toLowerCase()));
                                if (!sortAscending) {
                                  GlobalVariables.dummyConsultations = GlobalVariables.dummyConsultations.reversed.toList();
                                }
                                print(sortAscending);
                              });
                            },
                          ),
                          DataColumn(
                            label: Text('Patient', style: ThemeColors.thickDarkstyle,),
                            tooltip: "First and last name of the patient",
                            onSort: (columnIndex, sortAscending) {
                              setState(() {
                                _currentSortIndex = columnIndex;
                                _sortAsc = sortAscending;

                                GlobalVariables.dummyConsultations.sort((a, b) => a.patient.firstName.toLowerCase().compareTo(b.patient.firstName.toLowerCase()));
                                if (!sortAscending) {
                                  GlobalVariables.dummyConsultations = GlobalVariables.dummyConsultations.reversed.toList();
                                }
                              });
                            },
                          ),
                          DataColumn(label: Text(
                              'Blood Type',style: ThemeColors.thickDarkstyle)
                          ),
                          DataColumn(label: Text('Situation',style: ThemeColors.thickDarkstyle)
                          ),

                        ],
                        rows: createTableRows(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  consultationTransition( Widget child ){
    return PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: true,
        transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            )
        {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: transitionType,
          );
        },
        child: child,

    );
  }


  createTableRows() {
    List<DataRow> rows = [];
    GlobalVariables.dummyConsultations.forEach((consultation) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                  consultation.date,
                style: ThemeColors.mediumDarkStyle,
              ),
            ),
            DataCell(Text(consultation.duration,                 style: ThemeColors.mediumDarkStyle,
            )),
            DataCell(Text(consultation.patient.getName(),                 style: ThemeColors.mediumDarkStyle,
            )),
            DataCell(Text(consultation.patient.bloodType,                 style: ThemeColors.mediumDarkStyle,
            )),
            DataCell(Text(consultation.situation,                 style: ThemeColors.mediumDarkStyle,
            )),
          ],
          onSelectChanged: (newValue) {
              Navigator.push(context, CupertinoPageRoute(builder:(_) => ConsultationDetails(consultation: consultation,)));
          },
        )
      );
    });
    return rows;
  }
}
