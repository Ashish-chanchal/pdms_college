

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
        'dateTime': DateTime.now().toString(),
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
  final String experience;
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
    required this.experience,
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
      experience: json['experience'],
      gender: json['gender'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }
}
