import 'dart:core';
import 'dart:ui';

import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_projects/models/consultation.dart';
import 'package:flutter_projects/models/image.dart';
import 'package:flutter_projects/models/medical_person.dart';
import 'package:flutter_projects/models/patient.dart';
import 'package:flutter_projects/models/task.dart';
import 'package:flutter_projects/screens/consultations.dart';
import 'package:flutter_projects/screens/home.dart';
import 'package:flutter_projects/screens/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:editable/editable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalVariables {
  static Map<String, dynamic> menuItems =
   {
     "Home": [FontAwesomeIcons.home, HomeScreen()],
      "Appointments": [FontAwesomeIcons.calendarAlt, ConsulationScreen()],
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
    Task.name(3, "Stand up every hour", "You need to do this to not #@!% up your back", "Dobri Ervin", "Dobri Ervin", Priority.HIGH, Status.IN_PROGRESS),
    Task.name(4, "Visit your grandma sometimes", "No description needed", "Dobri Ervin", "Dobri Ervin", Priority.LOW, Status.TO_DO),
    Task.name(5, "EAt healthy stuff!!!", "Title", "Dobri Ervin", "Dobri Ervin", Priority.VERY_LOW, Status.BACKLOG),
  ];
  // static List<DatatableHeader> dummyHeaders = [
  //   DatatableHeader(
  //       text: "ID",
  //       value: "id",
  //       show: false,
  //       sortable: true,
  //       textAlign: TextAlign.right),
  //   DatatableHeader(
  //       text: "Name",
  //       value: "name",
  //       show: true,
  //       flex: 2,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Description",
  //       value: "description",
  //       show: true,
  //       sortable: true,
  //       textAlign: TextAlign.center),
  //   DatatableHeader(
  //       text: "Status",
  //       value: "status",
  //       show: true,
  //       sortable: true,
  //       sourceBuilder: (value, row){
  //         List list = List.from(value);
  //         return Container(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               list.first,
  //               style: GoogleFonts.lato(
  //                   color: list[1],
  //                   fontWeight: FontWeight.w700
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Assignee",
  //       value: "assignee",
  //       show: true,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Reporter",
  //       value: "reporter",
  //       show: true,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Priority",
  //       value: "priority",
  //       show: true,
  //       sortable: true,
  //       sourceBuilder: (value, row) {
  //         List list = List.from(value);
  //         return Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: FaIcon(
  //                     list[1],
  //                     color: list.last,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                       "${list.first}",
  //                       style: GoogleFonts.lato(
  //                           color: Colors.black
  //                       ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //       textAlign: TextAlign.left),
  // ];
  static Map<int,dynamic> columnTaskNames = {
    0 : ["Backlog", Colors.blueGrey, FontAwesomeIcons.layerGroup],
    1 : ["To Do", Colors.blue, FontAwesomeIcons.thumbtack],
    2 : ["In Progress", Colors.blueAccent, FontAwesomeIcons.spinner],
    3 : ["Done", Colors.greenAccent, FontAwesomeIcons.checkCircle],
  };

  static Map<int,dynamic> columnTasks = {
    0 : GlobalVariables.dummyTasks.where((element) => element.status == Status.BACKLOG).toList(),
    1 : GlobalVariables.dummyTasks.where((element) => element.status == Status.TO_DO).toList(),
    2 : GlobalVariables.dummyTasks.where((element) => element.status == Status.IN_PROGRESS).toList(),
    3 : GlobalVariables.dummyTasks.where((element) => element.status == Status.DONE).toList(),
  };

  //TODO ERP model and dummy data
  static List<dynamic> jsonOrders  = [
    {"eo_delivered": true,
      "message_unread": false,
      "user_id": [52, "Szabo Hermina"],
      "name": "SO1623",
      "currency_id": [1, "EUR"],
      "state": "done",
      "eo_invoiced": true,
      "date_order": "2021-01-05",
      "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"],
      "id": 1623,
      "amount_total": 37.19},
    {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1622", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2021-01-04", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1622, "amount_total": 36.65}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1620", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-30", "partner_id": [2230, "Liliana Urziceanu"], "id": 1620, "amount_total": 309.4}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1619", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-29", "partner_id": [2229, "Craus Lucian"], "id": 1619, "amount_total": 246.1}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1614", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-23", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1614, "amount_total": 3973.41}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1613", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-23", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1613, "amount_total": 119.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1610", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-23", "partner_id": [2228, "Panzariu Marin"], "id": 1610, "amount_total": 252.05}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1608", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-22", "partner_id": [1329, "MED TECH DISTRIBUTIONS SRL - RO36796558"], "id": 1608, "amount_total": 280.15}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1607", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-22", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1607, "amount_total": 0.0}, {"eo_delivered": true, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1606", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-22", "partner_id": [2226, "SYNEVIS CONSULTING S.R.L. - 40372151"], "id": 1606, "amount_total": 1428.0}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1605", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-22", "partner_id": [2168, "COMUNA APAHIDA - 4485243"], "id": 1605, "amount_total": 7873.08}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1603", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-18", "partner_id": [2224, "MEDICAL DERMATOCLINIC S.R.L. - 40669927"], "id": 1603, "amount_total": 476.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1602", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-18", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1602, "amount_total": 822.24}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1601", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-18", "partner_id": [891, "Spitalul Obstetrica Ginecologie - 4443183"], "id": 1601, "amount_total": 1428.0}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1612", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-17", "partner_id": [1846, "SC ALBACOM BIZ SRL - RO15432686"], "id": 1612, "amount_total": 9282.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1600", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-17", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1600, "amount_total": 0.0}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1597", "currency_id": [1, "EUR"],
      "state": "done", "eo_invoiced": true, "date_order": "2020-12-17", "partner_id": [1329, "MED TECH DISTRIBUTIONS SRL - RO36796558"],
      "id": 1597, "amount_total": 280.15},
    {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1596", "currency_id": [29, "RON"],
      "state": "done", "eo_invoiced": true, "date_order": "2020-12-17", "partner_id": [1329, "MED TECH DISTRIBUTIONS SRL - RO36796558"], "id": 1596, "amount_total": 2933.98},
{"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1595", "currency_id": [1, "EUR"],
  "state": "done", "eo_invoiced": true, "date_order": "2020-12-16", "partner_id": [2158, "MEDICAL DEVICE STORE SRL - RO 36765608"], "id": 1595, "amount_total": 766.36}, {"eo_delivered": true, "message_unread": false, "user_id": [39, "Udvari Zsolt"], "name": "SO1594", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-15", "partner_id": [156, "Meditech S.R.L. - RO14779840"], "id": 1594, "amount_total": 11496.59}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1186", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-15", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1186, "amount_total": 392.7}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1592", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-14", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1592, "amount_total": 58.31}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1591", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-12-14", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1591, "amount_total": 36.65}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1588", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-09", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1588, "amount_total": 416.5}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1587", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-08", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1587, "amount_total": 12852.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1586", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-07", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1586, "amount_total": 320000.0}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1583", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-04", "partner_id": [2210, "Massaci Gabriela"], "id": 1583, "amount_total": 146.14}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1582", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-12-03", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1582, "amount_total": 1106.09}, {"eo_delivered": true, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1581", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-27", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1581, "amount_total": 6783.0}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1579", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-27", "partner_id": [755, "SPITALUL CLINIC BOLI INFECTIOASE - 4485715"], "id": 1579, "amount_total": 4105.5}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1574", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-26", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1574, "amount_total": 993.65}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1573", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-25", "partner_id": [1459, "Spitalul Clinic Municipal Cluj-Napoca - 4547117"], "id": 1573, "amount_total": 261.8}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1572", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-25", "partner_id": [772, "4AMETAL SRL - RO37258751"], "id": 1572, "amount_total": 140.42}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1571", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-24", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1571, "amount_total": 5197.22}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1570", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-24", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1570, "amount_total": 248.23}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1569", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-24", "partner_id": [36, "Sp.Mil.de Urg. \" Dr.Constantin Papilian\" - 5399442"], "id": 1569, "amount_total": 41055.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1567", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-24", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1567, "amount_total": 37762.14}, {"eo_delivered": true, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1564", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-23", "partner_id": [239, "Next Industry SRL - RO29442442"], "id": 1564, "amount_total": 401.63}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1561", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-23", "partner_id": [2189, "Baiatu Gabriel"], "id": 1561, "amount_total": 91.4}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1560", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-23", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1560, "amount_total": 4034.1}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1559", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-23", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1559, "amount_total": 359.56}, {"eo_delivered": true, "message_unread": false, "user_id": [39, "Udvari Zsolt"], "name": "SO1556", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-20", "partner_id": [2186, "Dr. Vasile Tudor-Alexandru"], "id": 1556, "amount_total": 476.0}, {"eo_delivered": true, "message_unread": false, "user_id": [39, "Udvari Zsolt"], "name": "SO1555", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-20", "partner_id": [1365, "NICOMED SRL - 8059666"], "id": 1555, "amount_total": 476.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1554", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-20", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1554, "amount_total": 359.98}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1552", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-19", "partner_id": [2183, "SPITALUL DE PNEUMOFTIZIOLOGIE SATU MARE - 3897530"], "id": 1552, "amount_total": 19040.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1551", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-18", "partner_id": [2180, " Ionescu Georgeta"], "id": 1551, "amount_total": 317.5}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1550", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-18", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1550, "amount_total": 305.05}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1549", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-18", "partner_id": [2179, "Pislariu Marius"], "id": 1549, "amount_total": 535.5}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1548", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-17", "partner_id": [2177, "Diaconu Luminita"], "id": 1548, "amount_total": 204.45}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1545", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-12", "partner_id": [1433, "SPITALUL MUNICIPAL DE URGEN\u0162\u0102 \"ELENA BELDIMAN\" - 4446481"], "id": 1545, "amount_total": 74077.5}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1541", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-12", "partner_id": [2172, "CENTRU CLINIC MEDIQUEST SRL - 31172731"], "id": 1541, "amount_total": 4046.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1540", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-12", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1540, "amount_total": 24029.35}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1539", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-11", "partner_id": [1846, "SC ALBACOM BIZ SRL - RO15432686"], "id": 1539, "amount_total": 23205.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1538", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-11", "partner_id": [183, "E Uro S.R.L. - 14388990"], "id": 1538, "amount_total": 238.0}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1537", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-11", "partner_id": [2168, "COMUNA APAHIDA - 4485243"], "id": 1537, "amount_total": 9776.15}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1536", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [18, "Elastoffice Romania Srl - RO13270863"], "id": 1536, "amount_total": 72657.83}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1535", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1535, "amount_total": 2853.19}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1534", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1534, "amount_total": 3340.45}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1533", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [780, "Spitalul Clinic de Urgenta pentru Copii Cluj Napoca - 4426352"], "id": 1533, "amount_total": 1600.45}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1532", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [2165, "Andrei Dascalu"], "id": 1532, "amount_total": 252.05}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1531", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-10", "partner_id": [1419, "Spital Clinic CFR - Cluj Napoca - 4288349"], "id": 1531, "amount_total": 24990.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1530", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-09", "partner_id": [183, "E Uro S.R.L. - 14388990"], "id": 1530, "amount_total": 392.7}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1529", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-09", "partner_id": [2164, "SERVICIUL PUBLIC MANAGEMENT SPITALE, CABINETE MEDICALE \u015eI CRE\u015eE DIN MUNICIPIUL CRAIOVA - 23434670"], "id": 1529, "amount_total": 12495.0}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1528", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-09", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1528, "amount_total": 207.01}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1525", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-05", "partner_id": [2175, "FUNDATIA \"TIBOLDI\" - 8434587"], "id": 1525, "amount_total": 101.75}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1524", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-05", "partner_id": [2158, "MEDICAL DEVICE STORE SRL - RO 36765608"], "id": 1524, "amount_total": 859.78}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1521", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-03", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1521, "amount_total": 171.9}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1520", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-03", "partner_id": [1459, "Spitalul Clinic Municipal Cluj-Napoca - 4547117"], "id": 1520, "amount_total": 238.0}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1517", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-02", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1517, "amount_total": 262.19}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1516", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-11-02", "partner_id": [1091, "Spitalul Clinic de Urg. pentru copii Louis Turcanu Timisoara - 4548538"], "id": 1516, "amount_total": 5999.98}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1515", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-30", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1515, "amount_total": 2499.0}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1514", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-30", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1514, "amount_total": 993.65}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1513", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-30", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1513, "amount_total": 2689.4}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1512", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-30", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1512, "amount_total": 326.17}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1510", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-29", "partner_id": [2148, "ASOCIATIA ROTARY CLUB MIERCUREA CIUC - 40414362"], "id": 1510, "amount_total": 1576.75}, {"eo_delivered": true, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1508", "currency_id": [29, "RON"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-29", "partner_id": [1021, "DIAMEDIX IMPEX SA - RO8529458"], "id": 1508, "amount_total": 952.0}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1507", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-29", "partner_id": [2147, "DELTA HEALTH CARE  SRL - RO26630352"], "id": 1507, "amount_total": 119.0}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1504", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-28", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1504, "amount_total": 1108.39}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1500", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-26", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1500, "amount_total": 1108.73}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1497", "currency_id": [1, "EUR"], "state": "done", "eo_invoiced": true, "date_order": "2020-10-23", "partner_id": [471, "N&B S.R.L. - RO18338870"], "id": 1497, "amount_total": 266.56},
{"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1618", "currency_id": [29, "RON"],
  "state": "cancel", "eo_invoiced": false, "date_order": "2020-12-23", "partner_id": [1329, "MED TECH DISTRIBUTIONS SRL - RO36796558"], "id": 1618, "amount_total": 550113.55},
    {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1589", "currency_id": [29, "RON"],
      "state": "cancel", "eo_invoiced": false, "date_order": "2020-12-10", "partner_id": [2172, "CENTRU CLINIC MEDIQUEST SRL - 31172731"],
      "id": 1589, "amount_total": 1071.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"],
      "name": "SO1584", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-12-04",
      "partner_id": [2211, "UNIVERSITATEA SAPIENTIA - RO38660519"], "id": 1584, "amount_total": 69579.3},
    {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1578", "currency_id": [1, "EUR"],
      "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-27", "partner_id": [2158, "MEDICAL DEVICE STORE SRL - RO 36765608"],
      "id": 1578, "amount_total": 13280.4}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"],
      "name": "SO1576", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-26",
      "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1576, "amount_total": 479.57}, {"eo_delivered": false,
      "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1566", "currency_id": [1, "EUR"], "state": "cancel",
      "eo_invoiced": false, "date_order": "2020-11-24", "partner_id": [1247, "ZONEMED BIOMETRIX SRL - RO25638242"], "id": 1566,
      "amount_total": 3094.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1565",
      "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-24", "partner_id": [2194, "DOS Group"], "id": 1565, "amount_total": 51737.0}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1563", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-23", "partner_id": [2192, "Costi Blaj"], "id": 1563, "amount_total": 303.45}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1558", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-21", "partner_id": [2188, "MAKTRONIC MEDICAL LLP"], "id": 1558, "amount_total": 14095.2}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1557", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-21", "partner_id": [2187, "RUSSO DARIO ANTONIO - RSSD"], "id": 1557, "amount_total": 25869.18}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1553", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-19", "partner_id": [1247, "ZONEMED BIOMETRIX SRL - RO25638242"], "id": 1553, "amount_total": 65812.95}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1547", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-13", "partner_id": [2174, "G-GREEN INTERIOR KFT. - HU10356670"], "id": 1547, "amount_total": 517.65}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1546", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-13", "partner_id": [2158, "MEDICAL DEVICE STORE SRL - RO 36765608"], "id": 1546, "amount_total": 63179.13}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1544", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-12", "partner_id": [2173, "LAKATOS BOTOND \u00ceNTREPRINDERE INDIVIDUAL\u0102 - 19544950"], "id": 1544, "amount_total": 23844.79}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1543", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-12", "partner_id": [2158, "MEDICAL DEVICE STORE SRL - RO 36765608"], "id": 1543, "amount_total": 148745.28}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1527", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-06", "partner_id": [2160, "AMICO RHINO MEDICAL SRL - 35126363"], "id": 1527, "amount_total": 288145.06}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1526", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-06", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1526, "amount_total": 10.71}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1523", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-05", "partner_id": [1773, "DR.EMESE MEDFAM S.R.L. - 42079108"], "id": 1523, "amount_total": 262.79}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1522", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-04", "partner_id": [1773, "DR.EMESE MEDFAM S.R.L. - 42079108"], "id": 1522, "amount_total": 446.25}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1518", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-11-02", "partner_id": [2152, "Olasz Laszlo"], "id": 1518, "amount_total": 357.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1511", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-29", "partner_id": [2150, "OGTIA MED SRL - 35315443"], "id": 1511, "amount_total": 3808.0}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1506", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-28", "partner_id": [1846, "SC ALBACOM BIZ SRL - RO15432686"], "id": 1506, "amount_total": 315.35}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1505", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-28", "partner_id": [1846, "SC ALBACOM BIZ SRL - RO15432686"], "id": 1505, "amount_total": 529.55}, {"eo_delivered": false, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1503", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-28", "partner_id": [2142, "Procopiou Medishop Ltd - CY10060875M"], "id": 1503, "amount_total": 148745.28}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1502", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-28", "partner_id": [1091, "Spitalul Clinic de Urg. pentru copii Louis Turcanu Timisoara - 4548538"], "id": 1502, "amount_total": 5999.98}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1501", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-27", "partner_id": [1846, "SC ALBACOM BIZ SRL - RO15432686"], "id": 1501, "amount_total": 136.85}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1499", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-26", "partner_id": [156, "Meditech S.R.L. - RO14779840"], "id": 1499, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1498", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-26", "partner_id": [156, "Meditech S.R.L. - RO14779840"], "id": 1498, "amount_total": 17732.19}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1496", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-23", "partner_id": [641, "Deltamed S.R.L. - RO9434372"], "id": 1496, "amount_total": 23681.0}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1480", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-09", "partner_id": [2114, "STR\u0102JAN MEDICAL SRL - 33618009"], "id": 1480, "amount_total": 2217.22}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1477", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-08", "partner_id": [2108, "BURLAN RADU-CATALIN, BURLAN IOANA-SUZANA , BURLAN SILVIU-CRISTIAN - SOCIETATE PROFESIONALA NOTARIALA - RO31593960"], "id": 1477, "amount_total": 2261.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1467", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-02", "partner_id": [2096, "FETALMED AC SRL - 35579070"], "id": 1467, "amount_total": 35700.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1466", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-02", "partner_id": [2094, "MED ROBFEL SRL - 35327499"], "id": 1466, "amount_total": 3808.0}, {"eo_delivered": false, "message_unread": false, "user_id": [55, "Tar Ingrid"], "name": "SO1465", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-02", "partner_id": [2093, "Apostol Elena "], "id": 1465, "amount_total": 293.34}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1464", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-01", "partner_id": [2091, "Cabinet 2"], "id": 1464, "amount_total": 2066.15}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1463", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-01", "partner_id": [2090, "STOMAFAN S.R.L. - 5934456"], "id": 1463, "amount_total": 2069.49}, {"eo_delivered": false, "message_unread": false, "user_id": [55, "Tar Ingrid"], "name": "SO1461", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-01", "partner_id": [2085, "CARMEN MIRAUTA"], "id": 1461, "amount_total": 1466.68}, {"eo_delivered": false, "message_unread": false, "user_id": [55, "Tar Ingrid"], "name": "SO1460", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-10-01", "partner_id": [2084, "Negrea Rodica"], "id": 1460, "amount_total": 1466.68}, {"eo_delivered": false, "message_unread": false, "user_id": [55, "Tar Ingrid"], "name": "SO1459", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-30", "partner_id": [2083, "Mihaela Ana"], "id": 1459, "amount_total": 1725.5}, {"eo_delivered": false, "message_unread": false, "user_id": [55, "Tar Ingrid"], "name": "SO1458", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-30", "partner_id": [2082, "Corina Kadar"], "id": 1458, "amount_total": 1178.1}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1453", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-24", "partner_id": [2075, "Galna Zoltan"], "id": 1453, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1450", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-17", "partner_id": [2070, "Gergely Orsolya"], "id": 1450, "amount_total": 3199.99}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1439", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-15", "partner_id": [1897, "LORIAND DUOPLAST S.R.L. - RO4960473"], "id": 1439, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1436", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-14", "partner_id": [2058, "BRONX SRL - RO16898154"], "id": 1436, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1435", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-14", "partner_id": [2058, "BRONX SRL - RO16898154"], "id": 1435, "amount_total": 17732.19}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1427", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-10", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1427, "amount_total": 27.37}, {"eo_delivered": false, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1426", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-09", "partner_id": [1329, "MED TECH DISTRIBUTIONS SRL - RO36796558"], "id": 1426, "amount_total": 8996.9}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1410", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-09-01", "partner_id": [2039, "U.A.T. ORA\u015eUL RUPEA - 4443388"], "id": 1410, "amount_total": 547.4}, {"eo_delivered": true, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1404", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-28", "partner_id": [1426, "SPITALUL CLINIC JUDETEAN DE URGENTA BRASOV - 4384117"], "id": 1404, "amount_total": 559.3}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1401", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-26", "partner_id": [2026, "Unitatea de Asisten\u021b\u0103 Medico-Social\u0103 Media\u0219 - 15709206"], "id": 1401, "amount_total": 9401.0}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1395", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-25", "partner_id": [1247, "ZONEMED BIOMETRIX SRL - RO25638242"], "id": 1395, "amount_total": 805.63}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1394", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-24", "partner_id": [2021, "Andrei Sandulescu"], "id": 1394, "amount_total": 1725.5}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1380", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-14", "partner_id": [2008, "COR MEDIC S.R.L. - RO18824340"], "id": 1380, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1378", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-13", "partner_id": [2008, "COR MEDIC S.R.L. - RO18824340"], "id": 1378, "amount_total": 2034.9}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1368", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-05", "partner_id": [1995, "SNTGN TRANSGAZ S.A - RO13068733"], "id": 1368, "amount_total": 1120593.25}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1366", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-08-04", "partner_id": [1216, "AVICENA PROFERTIS SRL - 29531914"], "id": 1366, "amount_total": 4.76}, {"eo_delivered": true, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1359", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-28", "partner_id": [1149, "INSTITUTUL REGIONAL DE GASTROENTEROLOGIE - HEPATOLOGIE PROF. DR. OCTAVIAN FODOR CLUJ-NAPOCA - 4354523"], "id": 1359, "amount_total": 51408.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1358", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-28", "partner_id": [1149, "INSTITUTUL REGIONAL DE GASTROENTEROLOGIE - HEPATOLOGIE PROF. DR. OCTAVIAN FODOR CLUJ-NAPOCA - 4354523"], "id": 1358, "amount_total": 39876.9}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1357", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-27", "partner_id": [780, "Spitalul Clinic de Urgenta pentru Copii Cluj Napoca - 4426352"], "id": 1357, "amount_total": 1963.5}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1356", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-27", "partner_id": [1288, "YELLA S.R.L. - RO 21790913"], "id": 1356, "amount_total": 121916.69}, {"eo_delivered": true, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1344", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-20", "partner_id": [1796, "CASA JUDETEANA DE ASIGURARI DE SANATATE MURES - 11343845"], "id": 1344, "amount_total": 89.25}, {"eo_delivered": true, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1343", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-20", "partner_id": [1759, "MAXVELO TIME S.R.L. - 41098691"], "id": 1343, "amount_total": 35720.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1342", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-17", "partner_id": [286, "Proton Impex 2000 S.R.L. - RO9000578"], "id": 1342, "amount_total": 23924.0}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1335", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-10", "partner_id": [1972, "Kinga Radulescu-Szabo"], "id": 1335, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1333", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-09", "partner_id": [1791, "SOLAR BUSINESS PROJECT S.R.L. - RO31211776"], "id": 1333, "amount_total": 17732.19}, {"eo_delivered": true, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1315", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": true, "date_order": "2020-07-01", "partner_id": [1791, "SOLAR BUSINESS PROJECT S.R.L. - RO31211776"], "id": 1315, "amount_total": 3139.22}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1314", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-01", "partner_id": [780, "Spitalul Clinic de Urgenta pentru Copii Cluj Napoca - 4426352"], "id": 1314, "amount_total": 2168.48}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1313", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-07-01", "partner_id": [1959, "IMPACT IMOBILIARE SRL - 17468619"], "id": 1313, "amount_total": 1666.0}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1309", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-26", "partner_id": [1955, "Cocis Calin"], "id": 1309, "amount_total": 121916.69}, {"eo_delivered": true, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1308", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-25", "partner_id": [1943, "Dr. Oprea Olimpia"], "id": 1308, "amount_total": 7378.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1301", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-22", "partner_id": [1943, "Dr. Oprea Olimpia"], "id": 1301, "amount_total": 1666.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1300", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-22", "partner_id": [1943, "Dr. Oprea Olimpia"], "id": 1300, "amount_total": 13685.0}, {"eo_delivered": true, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1299", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-22", "partner_id": [1943, "Dr. Oprea Olimpia"], "id": 1299, "amount_total": 17493.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1291", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-18", "partner_id": [747, "Spital Clinic Municipal de Urgenta Timisoara"], "id": 1291, "amount_total": 225701.79}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1288", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-15", "partner_id": [1927, "ROCONSULT PROIECT S.R.L. - RO37121699"], "id": 1288, "amount_total": 708.05}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1287", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-15", "partner_id": [1791, "SOLAR BUSINESS PROJECT S.R.L. - RO31211776"], "id": 1287, "amount_total": 121916.69}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO1277", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-08", "partner_id": [1791, "SOLAR BUSINESS PROJECT S.R.L. - RO31211776"], "id": 1277, "amount_total": 17732.19}, {"eo_delivered": false, "message_unread": false, "user_id": [10, "Szasz Melinda"], "name": "SO1269", "currency_id": [1, "EUR"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-06-01", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1269, "amount_total": 22.47}, {"eo_delivered": true, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1261", "currency_id": [29, "RON"], "state": "cancel", "eo_invoiced": false, "date_order": "2020-05-26", "partner_id": [1900, "SPITALUL CLINIC JUDETEAN DE URGENTA TARGU MURES - 4323209"], "id": 1261, "amount_total": 1838.55},
{"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1260", "currency_id": [1, "EUR"],
  "state": "cancel", "eo_invoiced": false, "date_order": "2020-05-26", "partner_id": [1897, "LORIAND DUOPLAST S.R.L. - RO4960473"], "id": 1260, "amount_total": 856.8},
    {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1621", "currency_id": [29, "RON"],
      "state": "progress", "eo_invoiced": false, "date_order": "2021-01-04", "partner_id": [2231, "OIATRANS SRL - RO33064191"], "id": 1621, "amount_total": 1666.0}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1617", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-12-23", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1617, "amount_total": 8246.7}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1616", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-12-23", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1616, "amount_total": 9816.07}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1609", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-12-23", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1609, "amount_total": 17539.3}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1590", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-12-10", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1590, "amount_total": 408.1}, {"eo_delivered": false, "message_unread": false, "user_id": [44, "Simo Renata"], "name": "SO1580", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-11-30", "partner_id": [482, "KAPPA MEDICAL SRL - RO30557799"], "id": 1580, "amount_total": 6247.5}, {"eo_delivered": false, "message_unread": false, "user_id": [52, "Szabo Hermina"], "name": "SO1397", "currency_id": [29, "RON"], "state": "progress", "eo_invoiced": false, "date_order": "2020-08-26", "partner_id": [1389, "ALL DISPOMEDICALS SRL - RO30950037"], "id": 1397, "amount_total": 156366.0}, {"eo_delivered": false, "message_unread": false, "user_id": [47, "Szathmari Dalma"], "name": "SO1319", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-07-02", "partner_id": [695, "NIMKOS MEDSOLUTIONS SRL - RO36746002"], "id": 1319, "amount_total": 0.0}, {"eo_delivered": false, "message_unread": false, "user_id": [46, "Balazs Bernadett Hajnalka"], "name": "SO1137", "currency_id": [1, "EUR"], "state": "progress", "eo_invoiced": false, "date_order": "2020-04-06", "partner_id": [1791, "SOLAR BUSINESS PROJECT S.R.L. - RO31211776"], "id": 1137, "amount_total": 5593.0}, {"eo_delivered": false, "message_unread": false, "user_id": [6, "Budai Alexandru"], "name": "SO885", "currency_id": [29, "RON"], "state": "progress", "eo_invoiced": false, "date_order": "2019-10-30", "partner_id": [1178, "UNITATEA MILITARA NR. 02464 Bucuresti - 4364675"], "id": 885, "amount_total": 1811.35}
];

  // static List<Order> dummyOrders = jsonOrders.map((e) => new Order(e["name"],
  //     Agent(name: e["user_id"].first.toString() + e["user_id"].last ),
  //     Client(e["partner_id"].first.toString(),e["partner_id"].last),
  //     e["date_order"],
  //     e["amount_total"],
  //     e["currency_id"].last,
  //     e["state"],
  //     e["eo_delivered"],
  //     e["eo_invoiced"],
  // )).toList();


  static Map<int,dynamic> columnOrderNames = {
    0 : ["Active", ThemeColors.erondGreen, FontAwesomeIcons.calendarAlt],
    1 : ["Closed", Colors.green, FontAwesomeIcons.checkCircle],
    2 : ["Canceled", Colors.grey, FontAwesomeIcons.ban],
  };

  // static Map<int,dynamic> columnOrders = {
  //   0 : GlobalVariables.dummyOrders.where((element) => element.state == "done").toList(),
  //   1 : GlobalVariables.dummyOrders.where((element) => element.state == "progress").toList(),
  //   2 : GlobalVariables.dummyOrders.where((element) => element.state == "cancel").toList(),
  // };

  // static List<DatatableHeader> dummyOrderHeaders = [
  //   DatatableHeader(
  //       text: "Date",
  //       value: "date",
  //       show: true,
  //       flex: 2,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Client",
  //       value: "client",
  //       show: true,
  //       sortable: true,
  //       // sourceBuilder: (value, row) {
  //       //   Client client = value;
  //       //   return Text(
  //       //     client.name,
  //       //   );
  //       // },
  //       textAlign: TextAlign.center),
  //   DatatableHeader(
  //       text: "Agent",
  //       value: "agent",
  //       show: true,
  //       sortable: true,
  //       // sourceBuilder: (value, row) {
  //       //   Agent agent = value;
  //       //   return Text(
  //       //     agent.name,
  //       //   );
  //       // },
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Total",
  //       value: "total",
  //       show: true,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Currency",
  //       value: "currency",
  //       show: true,
  //       sortable: true,
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Shipped",
  //       value: "shipped",
  //       show: true,
  //       sortable: false,
  //       sourceBuilder: (value, row) {
  //         return Checkbox(
  //           value: value,
  //           onChanged: (bool? value) {
  //             print(value);
  //           },
  //         );
  //       },
  //       textAlign: TextAlign.left),
  //   DatatableHeader(
  //       text: "Invoiced",
  //       value: "invoiced",
  //       show: true,
  //       sortable: false,
  //       sourceBuilder: (value, row) {
  //         return Checkbox(
  //           value: value,
  //           onChanged: (bool? value) {
  //             print(value);
  //           },
  //         );
  //       },
  //       textAlign: TextAlign.left),
  // ];
  List cols = [
    {"title":'Id', 'widthFactor': 0.2, 'key':'name'},
    {"title":'Date', 'widthFactor': 0.1, 'key':'date'},
    {"title":'Client', 'widthFactor': 0.1, 'key':'client'},
    {"title":'Client', 'widthFactor': 0.1, 'key':'client'},
    {"title":'Agent',  'widthFactor': 0.2, 'key':'agent'},
    {"title":'Total', 'widthFactor': 0.1, 'key':'total'},
    {"title":'Currency', 'widthFactor': 0.1, 'key':'total'},
  ];
}