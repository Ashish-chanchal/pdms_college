import 'package:pdms/consts/consts.dart';


class Doctor {
  String name;
  String specialty;

  Doctor(this.name, this.specialty);
}



var iconlist = [
  AppIcons.body,
  AppIcons.ear,
  AppIcons.eye,
  AppIcons.heart,
  AppIcons.kidney,
  AppIcons.liver,
  AppIcons.lungs,
  AppIcons.stomach,
  AppIcons.tooth
];

var categorylist = [
  AppCategory.body,
  AppCategory.ear,
  AppCategory.eye,
  AppCategory.heart,
  AppCategory.kidney,
  AppCategory.liver,
  AppCategory.lungs,
  AppCategory.stomach,
  AppCategory.tooth
];

 List<Doctor> doctors = [
    Doctor("Dr. Smith", "Cardiologist"),
    Doctor("Dr. Johnson", "Pediatrician"),
    Doctor("Dr. Williams", "Dermatologist"),
    Doctor("Dr. Brown", "Oncologist"),
    Doctor("Dr. Miller", "Neurologist"),
  ];