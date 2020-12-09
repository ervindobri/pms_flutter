import 'package:FlutterProjects/models/consultation.dart';
import 'package:FlutterProjects/models/medical_person.dart';
import 'package:FlutterProjects/models/patient.dart';
import 'package:FlutterProjects/screens/consultations.dart';
import 'package:FlutterProjects/screens/patients.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalVariables {
  static Map<String, dynamic> menuItems =
   {
      "Consultations": [FontAwesomeIcons.calendarAlt, ConsulationScreen()],
      "Patients":[FontAwesomeIcons.userInjured, PatientsScreen()],
      "Blablabla":[FontAwesomeIcons.xRay, PatientsScreen()]
   };


  static List<Patient> dummyPatients = [
    Patient(1,"2020-08-08", "John", "Wick", 49, "Nope", "Nope", "Nope", "Nope", "A", "Nope", 69, 22, "0000"),
    Patient(2,"2020-05-08", "Jean", "Rhino", 22, "Nope", "Nope", "Nope", "Nope", "B", "Nope", 68, 23, "0000"),
    Patient(3,"2020-02-11", "World", "Hello", 69, "Nope", "Nope", "Nope", "Nope", "O", "Nope", 67, 24, "0000"),
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
    Consultation(dummyPatients[0],dummyMedics[0], "Confirmed", "2020-12-08", "2020-08-09 17:25", "16:40", "00:45"),
    Consultation(dummyPatients[1], dummyMedics[1], "Confirmed", "2017-03-22" ,"2020-08-09 15:50", "15:30", "00:30"),
    Consultation(dummyPatients[2], dummyMedics[2]),
  ];


}