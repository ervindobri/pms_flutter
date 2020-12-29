import 'dart:ui';

import 'package:flutter_projects/models/consultation.dart';
import 'package:flutter_projects/models/image.dart';
import 'package:flutter_projects/models/medical_person.dart';
import 'package:flutter_projects/models/patient.dart';
import 'package:flutter_projects/models/task.dart';
import 'package:flutter_projects/screens/consultations.dart';
import 'package:flutter_projects/screens/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_table/responsive_table.dart';

class GlobalVariables {
  static Map<String, dynamic> menuItems =
   {
      "Consultations": [FontAwesomeIcons.calendarAlt, ConsulationScreen()],
      "Patients":[FontAwesomeIcons.userInjured, PatientsScreen()],
      "Blablabla":[FontAwesomeIcons.xRay, PatientsScreen()]
   };


  static List<Patient> dummyPatients = [
    Patient(1,"2020-08-08", "John", "Wick", 49, "Nope", "Nope", "Nope", "Nope", "A", "Nope", 69, 22, "None"),
    Patient(2,"2020-05-08", "Jean", "Rhino", 22, "Nope", "Nope", "Nope", "Nope", "B", "Nope", 68, 23, "None"),
    Patient(3,"2020-02-11", "World", "Hello", 69, "Nope", "Nope", "Nope", "Nope", "O", "Nope", 67, 24, "None", ),
    // Patient(pid: 1, firstName: "John", lastName: "Wick", age: 49),
    // Patient(pid: 2, firstName: "Jean", lastName: "Rhino", sex: "Female"),
    // Patient(pid: 3, firstName: "Hello", lastName: "World", age: 36)
  ];
  static List<MedicalStaff> dummyMedics = [
    MedicalStaff.name(1,"Jozsi","Kuvuki", "kuvukijozsi@medixxx.ro", "0769122345"),
    MedicalStaff.name(2,"Jozsi","Kuvuki", "kuvukijozsi@medixxx.ro", "0769122345"),
    MedicalStaff.name(3,"Jozsi","Kuvuki", "kuvukijozsi@medixxx.ro", "0769122345"),
  ];
  static List<Consultation> dummyConsultations = [
    Consultation(dummyPatients[0],
        dummyMedics[0],
        [
          DermaImage("image1", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
          DermaImage("image2", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
          DermaImage("image3", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
        ],
        "Confirmed", "2020-12-08", "2020-08-09 17:25", "16:40", "00:45"),
    Consultation(dummyPatients[1], dummyMedics[1],
        [
          DermaImage("image1", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
          DermaImage("image2", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
          DermaImage("image3", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
        ],
        "Confirmed", "2017-03-22" ,"2020-08-09 15:50", "15:30", "00:30"),
    Consultation(dummyPatients[2], dummyMedics[2],
      [
        DermaImage("image1", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
        DermaImage("image2", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
        DermaImage("image3", "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg", "None"),
      ],),
  ];

  static var consultationURL = "https://vdm.dermatoscope.ro/web/dataset/search_read";


  //DUMMY VIEWS
  static List<Task> dummyTasks = [
    Task.name(1, "Do this", "W", "Dobri Ervin", "Dobri Ervin", Priority.MEDIUM, Status.TO_DO),
    Task.name(2, "Drink Water", "", "Dobri Ervin", "Dobri Ervin", Priority.VERY_HIGH, Status.DONE),
    Task.name(3, "Stand up every hour", "You need to do this to not fuck up your back", "Dobri Ervin", "Dobri Ervin", Priority.HIGH, Status.IN_PROGRESS),
    Task.name(4, "Visit your grandma sometimes", "No description needed", "Dobri Ervin", "Dobri Ervin", Priority.LOW, Status.TO_DO),
    Task.name(5, "EAt healthy stuff!!!", "Title", "Dobri Ervin", "Dobri Ervin", Priority.VERY_LOW, Status.BACKLOG),
  ];
  static List<DatatableHeader> dummyHeaders = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.right),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        editable:true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "description",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Status",
        value: "status",
        show: true,
        sortable: true,
        sourceBuilder: (value, row){
          List list = List.from(value);
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                list.first,
                style: GoogleFonts.lato(
                    color: list.last,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          );
        },
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Assignee",
        value: "assignee",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Reporter",
        value: "reporter",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Priority",
        value: "priority",
        show: true,
        sortable: true,
        sourceBuilder: (value, row) {
          List list = List.from(value);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      list[1],
                      color: list.last,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${list.first}",
                        style: GoogleFonts.lato(
                            color: Colors.black
                        ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        textAlign: TextAlign.left),
  ];

}