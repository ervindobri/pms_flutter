import 'dart:math';

import 'package:FlutterProjects/constants/GlobalVariables.dart';
import 'package:FlutterProjects/constants/theme_data.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'consultation_details.dart';

class ConsulationScreen extends StatefulWidget {
  @override
  _ConsulationScreenState createState() => _ConsulationScreenState();
}

class _ConsulationScreenState extends State<ConsulationScreen> {

  PlutoStateManager stateManager;
  PlutoSelectingMode gridSelectingMode = PlutoSelectingMode.Row;

  List<PlutoColumn> columns = [
    /// Text Column definition
    PlutoColumn(
      title: 'text column',
      field: 'text_field',
      type: PlutoColumnType.text(),
    ),
    /// Number Column definition
    PlutoColumn(
      title: 'number column',
      field: 'number_field',
      type: PlutoColumnType.number(),
    ),
    /// Select Column definition
    PlutoColumn(
      title: 'select column',
      field: 'select_field',
      type: PlutoColumnType.select(['item1', 'item2', 'item3']),
    ),
    /// Datetime Column definition
    PlutoColumn(
      title: 'date column',
      field: 'date_field',
      type: PlutoColumnType.date(),
    ),
    /// Time Column definition
    PlutoColumn(
      title: 'time column',
      field: 'time_field',
      type: PlutoColumnType.time(),
    ),
  ];

  List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value1'),
        'number_field': PlutoCell(value: 2020),
        'select_field': PlutoCell(value: 'item1'),
        'date_field': PlutoCell(value: '2020-08-06'),
        'time_field': PlutoCell(value: '12:30'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value2'),
        'number_field': PlutoCell(value: 2021),
        'select_field': PlutoCell(value: 'item2'),
        'date_field': PlutoCell(value: '2020-08-07'),
        'time_field': PlutoCell(value: '18:45'),
      },
    ),
    PlutoRow(
      cells: {
        'text_field': PlutoCell(value: 'Text cell value3'),
        'number_field': PlutoCell(value: 2022),
        'select_field': PlutoCell(value: 'item3'),
        'date_field': PlutoCell(value: '2020-08-08'),
        'time_field': PlutoCell(value: '23:59'),
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    bool _sortNameAsc = true;
    bool _sortAgeAsc = true;
    bool _sortHightAsc = true;
    bool _sortAsc = true;
    int _sortColumnIndex;

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
              child:
              Container(
                width: _width,
                height: _height - max(_height/20, 60),
                child:DataTable(
                    showCheckboxColumn: false, // <-- this is important
                    columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Duration')),
                      DataColumn(
                          label: Text('Patient'),
                          tooltip: "First and last name of the patient",
                          onSort: (columnIndex, sortAscending) {
                            setState(() {
                              if (columnIndex == _sortColumnIndex) {
                                _sortAsc = _sortNameAsc = sortAscending;
                              } else {
                                _sortColumnIndex = columnIndex;
                                _sortAsc = _sortNameAsc;
                              }
                              List<Patient> patients = [];
                              GlobalVariables.dummyConsultations.forEach((element) {
                                  patients.add(element.patient);
                              });
                              patients.sort((a, b) => a.firstName.compareTo(b.firstName));
                              if (!sortAscending) {
                                patients = patients.reversed.toList();
                              }
                            });
                          },
                      ),
                      DataColumn(label: Text('Blood Type')),
                      DataColumn(label: Text('Situation')),

                    ],
                    rows: createTableRows(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }




  createTableRows() {
    List<DataRow> rows = [];
    GlobalVariables.dummyConsultations.forEach((consultation) {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(consultation.date)),
            DataCell(Text(consultation.duration)),
            DataCell(Text(consultation.patient.getName())),
            DataCell(Text(consultation.patient.bloodType)),
            DataCell(Text(consultation.situation)),
          ],
          onSelectChanged: (newValue) {
            Navigator.push(context, CupertinoPageRoute(builder: (_)=> ConsultationDetails(consultation: consultation)) );
          },
        )
      );
    });
    return rows;
  }
}
