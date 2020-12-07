import 'package:FlutterProjects/models/patient.dart';
import 'package:FlutterProjects/screens/consultations.dart';
import 'package:FlutterProjects/screens/patients.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalVariables {
  static Map<String, dynamic> menuItems =
   {
      "Consultations": [FontAwesomeIcons.calendarAlt, ConsulationScreen()],
      "Patients":[FontAwesomeIcons.userInjured, PatientsScreen()],
      "Blablabla":[FontAwesomeIcons.xRay, PatientsScreen()]
   };


  static List<Patient> dummyPatients = [
    Patient(1,"2020-08-08", "John", "Wick", 49, "Nope", "Nope", "Nope", "Nope", "Nope", "Nope", "Nope", "Nope", "0000"),
    // Patient(pid: 1, firstName: "John", lastName: "Wick", age: 49),
    // Patient(pid: 2, firstName: "Jean", lastName: "Rhino", sex: "Female"),
    // Patient(pid: 3, firstName: "Hello", lastName: "World", age: 36)
  ];
}