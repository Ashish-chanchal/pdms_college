

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";


final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreAppointment {
  Future<String> BookAppointment(
      {required String name,
      required String problem,
      required String docUid}) async {
    try {
      var store = _firestore.collection('appointment').doc();

      await store.set({
        'name': name,
        'problem': problem,
        'docUid': docUid,
        'patUid': FirebaseAuth.instance.currentUser!.uid,
        'dateTime': DateTime.now().toString().substring(0,10),
      });
    } catch (e) {
      print(e);
      return "Failed";
    }
    return "Success";
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentList() async {
    var appointments = await FirebaseFirestore.instance
        .collection('appointment')
        .where('patUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return appointments;
  }
  // Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentDocList() async {
  //   var appointments = await FirebaseFirestore.instance
  //       .collection('appointment')
  //       .where('docUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   return appointments;
  // }
Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentDocList() async {
  var today = DateTime.now();
  
  // Format today's date to match the format in the Firestore documents
  var formattedToday = DateTime(today.year, today.month, today.day).toString().substring(0,10);

  var appointments = await FirebaseFirestore.instance
      .collection('appointment')
      .where('docUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('dateTime', isEqualTo: formattedToday)
      .get();
  
  return appointments;
}

Future<QuerySnapshot<Map<String, dynamic>>> getPastAppointmentDocList() async {
  // Get the current date and time
   var today = DateTime.now();
  
  // Format today's date to match the format in the Firestore documents
  var formattedToday = DateTime(today.year, today.month, today.day).toString().substring(0,10);
  // Fetch appointments for the current user where the date is before today
  var appointments = await FirebaseFirestore.instance
      .collection('appointment')
      .where('docUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('dateTime', isLessThan: formattedToday) // Assuming the date field is stored as a Firestore Timestamp
      .get();

  return appointments;
}


  Future<Doctors> getDoctorDetails(String docUid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('doctor').doc(docUid).get();
    Map<String, dynamic> data = snapshot.data()!;
    return Doctors.fromJson(data);
  }
}

class Doctors {
  final String category;
  final String clinicAddress;
  final String drId;
  final String email;
  final String gender;
  final String imageUrl;
  final String name;
  final String phone;
  final String userId;

  Doctors({
    required this.category,
    required this.clinicAddress,
    required this.drId,
    required this.email,

    required this.gender,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.userId,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      category: json['category'],
      clinicAddress: json['clinicadd'],
      drId: json['drId'],
      email: json['email'],

      gender: json['gender'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }
}
