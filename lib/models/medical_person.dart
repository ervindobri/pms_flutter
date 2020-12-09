class MedicalStaff{
  int mid;
  String title;
  String firstName;
  String lastName;
  String phone;
  String mobilePhone;
  String emailAddress;
  String address;
  String specialty;
  String fax;
  String sex;
  bool informationAndTelemedicine;

  MedicalStaff.name(
      this.mid,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phone,
      [
      this.title = "Dr.",
        this.mobilePhone = "000000",
      this.address = "None",
      this.specialty = "General medic",
      this.fax  = "None",
      this.sex  = "None",
      this.informationAndTelemedicine = true
      ]);

  String fullName() {
    return this.title + " " + this.firstName + " " + this.lastName;
  }
}

