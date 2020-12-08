

import 'package:flutter/src/widgets/framework.dart';

class Patient{
  int pid; //cod asigurat
  //personal info
  String birthDate = "2020-08-08";
  String firstName ="John";
  String lastName = "Doe";
  int age = 22;
  String sex = "Male";
  //profiessional information
  String occupation = "homeless";
  String jobAddress ="everywhere street, nr.22";
  String educationLevel = "none";

  //Medical info
  String bloodType;
  String RH;
  double waistSize;
  double weight;
  String diseases;
  String allergies;

  //contact information
  String address = "street";
  String city = "Barcelona";
  String country = "Spain";
  String state = "";
  String zipCode = "226933";
  String phone;
  String fax;
  String email;

  Patient(
      this.pid,
      this.birthDate,
      this.firstName,
      this.lastName,
      this.age,
      [
      this.sex = "Male",
      this.occupation = "",
      this.jobAddress ="",
      this.educationLevel ="",
      this.bloodType = "A",
      this.RH = "Positive",
      this.waistSize = 69.22,
      this.weight = 61,
      this.diseases = "None",
      this.allergies = "None",
      this.address = "",
      this.city = "",
      this.country = "",
      this.state = "",
      this.zipCode = "000000",
      this.phone = "00000030",
      this.fax = "0000000",
      this.email = "johndoe@example.com"
      ]
      );

  Patient.name({
      this.pid,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.age,
      this.sex,
      this.occupation,
      this.jobAddress,
      this.educationLevel,
      this.address,
      this.city,
      this.country,
      this.state,
      this.zipCode});

  String getName() {
    return this.firstName + " " + this.lastName;
  }
}