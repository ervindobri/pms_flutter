import 'package:FlutterProjects/models/medical_person.dart';
import 'package:FlutterProjects/models/patient.dart';

class Consultation{
  final Patient patient;
  final MedicalStaff medic;
    //general info
    String situation;
    String date;
    String finishDate;
    String hour;
    String duration;

    //anamneza - kortortenet
    String hospitalizationType;
    List<String> hospitalizationReasons;
    String hospitalizionDiagnosis;
    String dischargeDiagnosis;
    String medications;
    String criteria; //internare?

    String familyMedicalHistory;
    String pathologicalHistory;
    String livingAndWorkingConditions;
    String behavior;

    Consultation(
        this.patient,
        this.medic,
      [
      this.situation = "Confirmed",
      this.date = "2020-08-08",
      this.finishDate = "2020-08-09 15:50",
      this.hour = "15:30",
      this.duration = "00:20",
      this.hospitalizationType = "Recommendation from Family Doc",
      this.hospitalizationReasons = const ["Headache"],
      this.hospitalizionDiagnosis = "Brain cancer",
      this.dischargeDiagnosis = "Dead",
      this.medications = "Paracetamol",
      this.criteria = "Dunno",
      this.familyMedicalHistory = "Diabetes",
      this.pathologicalHistory = "Chronic diarrhea",
      this.livingAndWorkingConditions = "Big house and no job",
      this.behavior = "Abnormal"
      ]);
}