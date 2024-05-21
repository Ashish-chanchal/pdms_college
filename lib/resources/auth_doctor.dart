import "dart:async";
import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/foundation.dart";
import "package:pdms/consts/consts.dart";

import "package:pdms/views/login_view/login_view.dart";

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
UserCredential? userCredential;

class StoreDocData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    String downloadUrl = "";
    try {
      Reference ref = _storage.ref().child(childName);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String url = await snapshot.ref.getDownloadURL();
      downloadUrl = url;
    } catch (e) {
      print(e);
      return "";
    }
    return downloadUrl;
  }

  Future<String> signupdoctor(
      {required String name,
      required String gender,
      required String clinicadd,
      required String drId,
      required String category,
      required String email,
      required String password,
      required String phone,
      required String about,
      required String clinicTiming,
      required Uint8List file}) async {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String imageUrl = await uploadImageToStorage(name, file);

    String status = await storeUserData(userCredential!.user!.uid, name, gender,
        clinicadd, drId, category, email, phone, about, clinicTiming, imageUrl);

    return status;
  }

  Future<String> storeUserData(
      String uid,
      String name,
      String gender,
      String clinicadd,
      String drId,
      String category,
      String email,
      String phone,
      String about,
      String clinicTiming,
      String imageUrl) async {
    try {
      var store = _firestore.collection('doctor').doc(uid);

      await store.set({
        'name': name,
        'gender': gender,
        'clinicadd': clinicadd,
        'drId': drId,
        'category': category,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
        'about': about,
        'clinicTiming': clinicTiming,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (e) {
      print(e);
      return "Failed";
    }
    return "Success";
  }

  loginUser({required email, required password}) async {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.off(() => const LoginView());
  }

  Future<Clinic> getClinicData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic> data = snapshot.data()!;
    return Clinic.fromJson(data);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentDocListByDoctor(
      String patuid) async {
    var appointments = await FirebaseFirestore.instance
        .collection('appointment')
        .where('docUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('patUid', isEqualTo: patuid)
        .limit(1)
        .get();

    return appointments;
  }

  void updateDocInfo(Map<String, dynamic> userData) async {
    try {
      // Get reference to the Firestore database
      final firestore = FirebaseFirestore.instance;

      // Reference to the user's document
      final userDocRef = firestore
          .collection('doctor')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Update the document with the new data
      await userDocRef.update(userData);
      Get.back();

      print('User profile updated successfully!');
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  // Call this function when the user taps the update button
  void updateDoc({
    required String name,
    required String email,
    required String phone,
    required String category,
    required String clinicAddress,
    required String about,
    required String clinicTiming,
    required String drId ,
    required  String gender
  }) async {
    // Assuming this is the user's ID
    Map<String, dynamic> userData = {
      'name': name,
      'email': email,
      'phone': phone,
      'category': category,
      'clinicadd': clinicAddress,
      'drId': drId,
      'about': about,
      'clinicTiming': clinicTiming,
      'gender':gender
    };

    updateDocInfo(userData);
  }
}

class Clinic {
  final String category;
  final String clinicAddress;
  final String doctorId;
  final String email;
  final String about;
  final String drId;
  final String clinicTiming;
  final String gender;
  final String imageUrl;
  final String name;
  final String phone;
  final String userId;

  Clinic({
    required this.category,
    required this.clinicAddress,
    required this.doctorId,
    required this.email,
    required this.about,
    required this.clinicTiming,
    required this.gender,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.userId,
    required this.drId,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      category: json['category'],
      clinicAddress: json['clinicadd'],
      doctorId: json['drId'],
      email: json['email'],
      about: json['about'],
      drId: json['drId'],
      clinicTiming: json['clinicTiming'],
      gender: json['gender'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }
}
